#!/bin/bash

set -e

docker-compose exec --user aiida aiida /bin/bash -l -c "verdi data crystal createpredefined"
docker-compose exec --user aiida aiida /bin/bash -l -c "verdi data crystal uploadfamily --name MINIMAL --path ~/code/aiida-crystal/aiida_crystal/tests/input_files/sto3g"
docker-compose exec --user aiida aiida /bin/bash -l -c "verdi run /home/aiida/code/aiida-crystal/examples/test_MgO_MPDS.py"
