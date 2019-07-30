#!/bin/bash

export BRANCH=basisset

exec /sbin/setuser aiida \
pip install --user git+file:///home/aiida/code/aiida-crystal@$BRANCH git+file:///home/aiida/code/mpds-aiida@$BRANCH
