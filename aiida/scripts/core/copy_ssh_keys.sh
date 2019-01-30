#!/bin/bash

exec /sbin/setuser aiida \
cp /home/aiida/.ssh/keys/aiida_key /home/aiida/.ssh/id_rsa && \
chmod 600 /home/aiida/.ssh/id_rsa