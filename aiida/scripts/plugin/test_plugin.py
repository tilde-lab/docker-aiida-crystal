#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Submit a test calculation on localhost.

Usage: verdi run test_submit_main.py

Note: This script assumes you have set up computer and code as in README.md.
"""
import os
import aiida_crystal.tests

def test_example(new_database, new_workdir):

    from aiida.orm import DataFactory
    from aiida.orm import Code
    StructureData = DataFactory('structure')
    from ase.spacegroup import crystal
    from aiida_crystal.data.basis_set import BasisSetData
    from aiida_crystal.workflows.symmetrise_3d_struct import run_symmetrise_3d_structure

    # get code
    code = Code.get_from_string('cry@torquessh')

    # Prepare input parameters
    params_dict = {
        "title": "NiO Bulk with AFM spin",
        "geometry.optimise.type": "FULLOPTG",
        "scf.single": "UHF",
        "scf.k_points": (8, 8),
        "scf.spinlock.SPINLOCK": (0, 15),
        "scf.numerical.FMIXING": 30,
        "scf.post_scf": ["PPAN"]
    }

    # Ni0
    atoms = crystal(
        symbols=[28, 8],
        basis=[[0, 0, 0], [0.5, 0.5, 0.5]],
        spacegroup=225,
        cellpar=[4.164, 4.164, 4.164, 90, 90, 90])
    atoms.set_tags([1, 1, 2, 2, 0, 0, 0, 0])
    instruct = StructureData(ase=atoms)

    settings_dict = {"kinds.spin_alpha": ["Ni1"], "kinds.spin_beta": ["Ni2"]}
    instruct, settings = run_symmetrise_3d_structure(instruct, settings_dict)

    BasisSetData.upload_basisset_family(
        os.path.join(aiida_crystal.tests.TEST_DIR, "input_files", "sto3g"),
        "sto3g",
        "minimal basis sets",
        stop_if_existing=False,
        extension=".basis")

    # set up calculation
    calc = code.new_calc()
    calc.label = "aiida_crystal test"
    calc.description = "Test job submission with the aiida_crystal plugin"
    calc.set_max_wallclock_seconds(3600)
    calc.set_withmpi(False)
    calc.set_resources({"num_machines": 1, "num_mpiprocs_per_machine": 1})

    params = calc.prepare_and_validate(
        params_dict, instruct, settings, basis_family="sto3g", flattened=True)

    calc.use_parameters(params)
    calc.use_structure(instruct)
    calc.use_settings(settings)
    calc.use_basisset_from_family("sto3g")

    calc.store_all()

    calc.submit()

    print("submitted calculation; calc=Calculation(PK={})".format(
        calc.dbnode.pk))


if __name__ == "__main__":

    wrkdir = "./aiida_workdir"
    if not os.path.exists(wrkdir):
        os.makedirs(wrkdir)

    test_example(None, os.path.abspath(wrkdir))
