#!/bin/bash

sleep 2

# required config.

export PATH=$PATH:/usr/local/bin/
export QT_QPA_PLATFORM=offscreen
export JACK_NO_AUDIO_RESERVATION=1

# run supercollider project.

/usr/local/bin/sclang ~/everything/everything.scd
