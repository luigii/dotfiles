#!/bin/bash
eval `keychain -Q -q --eval --agents ssh id_rsa`
. $HOME/.bashrc
