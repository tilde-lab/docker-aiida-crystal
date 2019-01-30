#!/bin/bash

# Stop the script as soon as one step fails
set -e

#### This script takes care of starting up the full environment

## Step 1. Start daemonized, rebuilding images if needed
docker-compose up -d --build
echo "Waiting for containers to start..."
sleep 15
## Step 3. Change mode of id_rsa to 600
docker-compose exec --user aiida aiida /bin/bash -l -c "chmod 600 ~/.ssh/id_rsa"
## Step 2. Start verdi daemon
docker-compose exec --user aiida aiida /bin/bash -l -c "verdi daemon start"

