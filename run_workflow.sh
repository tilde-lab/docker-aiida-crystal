#!/bin/bash

set -e

docker-compose exec --user aiida aiida /bin/bash -l -c "cd /home/aiida/code//mpds-aiida/mpds_aiida_workflows/tests/basis && verdi data crystal-basis uploadfamily --name=sto-3g --description=sto-3g"
docker-compose exec --user aiida aiida /bin/bash -l -c "verdi run /home/aiida/code/aiida-crystal/examples/test_MgO_MPDS.py"
