#!/bin/bash

set -e

docker-compose exec --user aiida aiida /bin/bash -l -c "verdi data crystal_dft createpredefined"
docker-compose exec --user aiida aiida /bin/bash -l -c "verdi data crystal_dft uploadfamily --name MINIMAL --path ~/code/aiida-crystal/aiida_crystal_dft/tests/input_files/sto3g"
docker-compose exec --user aiida aiida /bin/bash -l -c "verdi run /home/aiida/code/aiida-crystal/examples/test_MgO_MPDS.py"
