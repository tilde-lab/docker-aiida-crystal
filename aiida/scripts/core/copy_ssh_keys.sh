#!/bin/bash

exec /sbin/setuser aiida \
cp /home/aiida/.ssh/keys/aiida_key /home/aiida/.ssh/id_rsa
exec /sbin/setuser aiida \
cp /home/aiida/.ssh/keys/aiida_key.pub /home/aiida/.ssh/id_rsa.pub
exec /sbin/setuser aiida \
chmod 600 /home/aiida/.ssh/id_rsa 
