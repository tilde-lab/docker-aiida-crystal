#!/bin/bash

function gen_pwd_char() {
    s=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890-_%/
    # Length of the string
    p=$(( $RANDOM % 66))
    echo -n ${s:$p:1}
}

#12-char pwd
POSTGRES_PASSWORD=`gen_pwd_char; gen_pwd_char; gen_pwd_char; gen_pwd_char; gen_pwd_char; gen_pwd_char; gen_pwd_char; gen_pwd_char; gen_pwd_char; gen_pwd_char; gen_pwd_char; gen_pwd_char; `

POSTGRES_USER=aiida
POSTGRES_DB=aiida_default
AIIDA_BACKEND=django

# TODO: To be changed/autogenerated

if [ -e sshkeys ]
then
    echo "folder sshkeys exists, remove it first"
    exit 1
fi

mkdir -p sshkeys/torque
ssh-keygen -t rsa -f sshkeys/torque/aiida_key -C "Key for Dockerized AiiDA service" -N ''

mkdir -p sshkeys/aiida
ssh-keygen -t rsa -f sshkeys/aiida/ssh_key -C "Key for SSH container access" -N ''
cp sshkeys/aiida/ssh_key.pub ../aiida/scripts

# To allow to read it from inside the docker container, I make the 
# private key readable by everybody, but I put the containing folder as
# readable only by me
chmod go= sshkeys/
chmod go=rx sshkeys/torque/
chmod go+r sshkeys/torque/aiida_key

THEKEY=`cat sshkeys/torque/aiida_key.pub`

# No need of escaping
echo 'AUTHORIZED_KEY='"$THEKEY" > env/torque.env

echo 'AIIDA_USER='"$POSTGRES_USER" > env/aiida.env
echo 'AIIDA_DB='"$POSTGRES_DB" >> env/aiida.env
echo 'AIIDA_PWD='"$POSTGRES_PASSWORD" >> env/aiida.env
echo 'AIIDA_BACKEND='"$AIIDA_BACKEND" >> env/aiida.env
echo 'TZ=UTC' >> env/aiida.env

echo 'POSTGRES_USER='"$POSTGRES_USER" > env/postgres.env
echo 'POSTGRES_DB='"$POSTGRES_DB" >> env/postgres.env
echo 'POSTGRES_PASSWORD='"$POSTGRES_PASSWORD" >> env/postgres.env

# Copy init files to various locations, substituting logins and passwords
cp init/init.sql ../db
sed -i 's/%AIIDADB_NAME%/'"$POSTGRES_DB"'/g' ../db/init.sql
sed -i 's/%AIIDADB_USER%/'"$POSTGRES_USER"'/g' ../db/init.sql

cp init/config.json ../aiida
sed -i 's/%AIIDADB_NAME%/'"$POSTGRES_DB"'/g' ../aiida/config.json
sed -i 's/%AIIDADB_USER%/'"$POSTGRES_USER"'/g' ../aiida/config.json
sed -i 's/%AIIDADB_PASS%/'"$POSTGRES_PASSWORD"'/g' ../aiida/config.json
sed -i 's/%AIIDADB_BACKEND%/'"$AIIDA_BACKEND"'/g' ../aiida/config.json
