
# Check for an interactive session
[ -z "$PS1" ] && return
PS1='[\u@\h \W]\$ '

#Little shorthand aliases to make life easier

alias whatsupdoc='sudo nmap -O --osscan-limit 10.0.0.*'
alias lock="xscreensaver-command -lock"
alias csb='espeak "cool story bro"'
alias suspend='sudo pm-suspend'
alias df='df -h'

#Mountpoints and options are long and boring to type out
#keith and raid no longer work since keith became a Lion box

alias keith='sudo mount -t cifs //keith/Warez /mnt/keith/ -o guest'
alias raid='sudo mount -t cifs //keith/RAID /mnt/raid -o guest'
alias spoon='sshfs luigii@spoon: ~/spoon'

#External monitor commands for my 1080p monitor

alias monitoron='xrandr --output VGA-0 --mode 1920x1080 --right-of LVDS'
alias monitoroff='xrandr --output VGA-0 --off'

#Simple default options

alias ls='ls --color=auto'
alias scrot="scrot /home/conall/images/screencaps/%Y-%m-%d-%R.png"
alias emacs='emacs -nw'
alias scr='screen -dr'
alias texi2pdf='texi2pdf --build=clean -q'

#Non-proxy env variables

export COUNTRY='IE'
export EDITOR='emacs -nw'
PATH=$PATH:/usr/bin/site_perl:/opt/simili/bin:/opt/simili/tcl/bin
export PATH

#Proxies for a netsoc room ethernet connection

#export http_proxy="spoon.netsoc.tcd.ie:8000"
#export https_proxy="spoon.netsoc.tcd.ie:8000"
#export ftp_proxy="spoon.netsoc.tcd.ie:8000"

#Proxies for anywhere else in college

#export http_proxy="localhost:8080"
#export https_proxy="localhost:8080"
#export ftp_proxy="localhost:8080"
