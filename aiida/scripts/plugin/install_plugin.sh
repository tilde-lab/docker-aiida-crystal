#!/bin/bash

export BRANCH=aiida_beta

exec /sbin/setuser aiida pip install --user -e /home/aiida/code/aiida-crystal /home/aiida/code/mpds-aiida
# pip install --user git+file:///home/aiida/code/aiida-crystal@$BRANCH git+file:///home/aiida/code/mpds-aiida@$BRANCH
