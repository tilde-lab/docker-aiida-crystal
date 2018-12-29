#!/bin/bash

# Stop the script as soon as one step fails
set -e

## I can now setup the computer etc.
docker-compose exec --user aiida aiida /bin/bash -l -c "verdi run /home/aiida/.dockerscripts/plugin/test_plugin.py"
#docker-compose exec --user root db /bin/bash -l -c "pg_dump -U aiida -d aiida_default -h localhost -C --column-inserts" > dump.sql