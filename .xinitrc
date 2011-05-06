setxkbmap -layout ie -option ctrl:nocaps &
urxvtd &
dropboxd &
export GTK_XFT=1 &
/usr/bin/xscreensaver -no-splash &
exec awesome

