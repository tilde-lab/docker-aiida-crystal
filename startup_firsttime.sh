#!/bin/bash

# Stop the script as soon as one step fails
set -e

#### This script takes care of starting up the full environment

## Step 1. Create passwords and credentials
if [ -e compose-init/sshkeys ]
then
    echo "Folder init/sshkeys exists already. I assume you already created"
    echo "the keys once, and I will reuse the content of the init folder."
    echo "If this is not the case, remove the init/sshkeys folder, and rerun"
    echo "this script."
fi
cd compose-init && ./run_once_generate_passwords.sh && cd ..

## Step 2. Start the full set of images. I also rebuild (this is not needed
## in general). Note that I start daemonized
docker-compose up -d --build

## Step 3. Setup AiiDA
## According to how I generated the aiida image, this will have already set
## up AiiDA.
## I can now setup the computer etc.
#docker-compose exec --user aiida aiida /bin/bash -l -c "/home/aiida/.dockerscripts/core/aiida_setup.sh"

### PLUGIN-SPECIFIC SECTION
#docker-compose exec --user aiida aiida /bin/bash -l -c "pip install --user -e /home/aiida/code/aiida-crystal17 && reentry scan"

# Setup also the code
#docker-compose exec --user aiida aiida /bin/bash -l -c "/home/aiida/.dockerscripts/plugin/code_setup.sh"


