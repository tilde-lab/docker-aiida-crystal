#!/bin/bash

set -e

docker-compose exec --user aiida aiida /bin/bash -l -c "verdi data crystal createpredefined"
docker-compose exec --user aiida aiida /bin/bash -l -c "verdi run /home/aiida/code/aiida-crystal/examples/test_MgO_MPDS.py"
