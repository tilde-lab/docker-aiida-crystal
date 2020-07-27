#!/bin/bash

# Stop the script as soon as one step fails
set -e

docker-compose exec --user root db /bin/bash -l -c "pg_dump -U aiida -d aiida_default -h localhost -C --column-inserts" > dump.sql
sed 's/aiida_default/%AIIDADB_NAME%/g; s/aiida;/%AIIDADB_USER%;/g' dump.sql > init.sql
dos2unix dump.sql
dos2unix init.sql