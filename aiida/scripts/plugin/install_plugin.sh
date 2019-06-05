#!/bin/bash

exec /sbin/setuser aiida \
pip install --user git+file:///home/aiida/code/aiida-crystal@master /home/aiida/code/mpds-aiida
