#!/bin/bash
# Start keychain on startup, to avoid having to enter my password
# ten times per day
eval `keychain -Q -q --eval --agents ssh id_rsa`

# Start emacs as a daemon
eval `emacs --daemon`

# Set the options found in ~/.bashrc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
