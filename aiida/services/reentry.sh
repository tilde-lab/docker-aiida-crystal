#!/bin/bash

exec /sbin/setuser aiida \
/home/aiida/.local/bin/reentry scan
exec /sbin/setuser aiida \
/home/aiida/.local/bin/verdi daemon start --foreground