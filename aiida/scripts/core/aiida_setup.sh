#!/bin/bash
# Setup the default AiiDA profile

echo "AiiDA-setup running as user: "`whoami`

if [ ! -e ~/.ssh/id_rsa ]
then
    # Copy keys
    cp ~/.ssh/keys/aiida_key ~/.ssh/id_rsa
    cp ~/.ssh/keys/aiida_key.pub ~/.ssh/id_rsa.pub
    # Give right permissions
    chmod 600 ~/.ssh/id_rsa
    chmod 644 ~/.ssh/id_rsa.pub
fi

# Wait for ssh on torquessh
~/.dockerscripts/core/wait-for-it.sh torquessh:22 -t 0

# Store the host in known_hosts, if not already there
ssh-keygen -F torquessh > /dev/null 2>&1 || ssh-keyscan torquessh >> ~/.ssh/known_hosts

# Wait for postgres to be up

if [ "$AIIDA_DBPORT" == "" ]
then
    AIIDA_PORT=5432
fi
~/.dockerscripts/core/wait-for-it.sh db:$AIIDA_PORT -t 0

echo "which verdi"
which verdi

echo "echo PATH"
echo $PATH

# Check if I need to install AiiDA
if [ -e ~/.aiida/config.json ]
then
    echo "AiiDA already set up, this is simply a restart."
    exit 0
else
    if [ "$AIIDA_DB" == "" ]
    then
	echo "First startup and AIIDA_DB not specified, exiting..."
	exit 1
    fi
    if [ "$AIIDA_USER" == "" ]
    then
	echo "First startup and AIIDA_USER not specified, exiting..."
	exit 1
    fi
    if [ "$AIIDA_PWD" == "" ]
    then
	echo "First startup and AIIDA_PWD not specified, exiting..."
	exit 1
    fi
    if [ "$AIIDA_BACKEND" == "" ]
    then
	AIIDA_BACKEND=django
    fi
    

    verdi setup --non-interactive \
	--backend=$AIIDA_BACKEND \
	--email="aiida@localhost" \
	--db-host=db \
	--db-port=$AIIDA_PORT \
	--db-name=$AIIDA_DB \
	--db-username=$AIIDA_USER \
	--db-password=$AIIDA_PWD \
	--repository=/home/aiida/.aiida_repo/ \
	--first-name=AiiDA --last-name="In Docker" \
	--institution="None" \
        --set-default default

    # Start the daemon now
    verdi daemon start

    # Setup the computer 'torquessh'
    verdi computer setup --non-interactive \
        --label=torquessh \
        --hostname=torquessh \
        --enabled \
        --transport=ssh \
        --scheduler=torque

    # Configure it
    verdi computer configure ssh --non-interactive \
        --username=app \
        --port=22 \
        --key-filename=~/.ssh/id_rsa \
        --key-policy=AutoAddPolicy \
        torquessh
 
fi

