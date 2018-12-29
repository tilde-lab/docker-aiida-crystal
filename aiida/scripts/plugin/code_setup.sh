#!/bin/bash

# Setup the code non-interactively

verdi code setup --non-interactive \
        --label=cry \
        --sescription="CRYSTAL14 code" \
        --input_plugin=crystal17.main \
        --on-computer \
        --computer=torquessh \
        --remote-abs-path=/usr/bin/crystal
