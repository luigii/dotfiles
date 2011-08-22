#!/usr/bin/bash
setxkbmap -layout ie -option ctrl:nocaps &
urxvtd &
dropboxd &
export GTK_XFT=1 &
export GTK2_RC_FILES="$HOME/.gtkrc-2.0" &
/usr/bin/xscreensaver -no-splash &
exec awesome
