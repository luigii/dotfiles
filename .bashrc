### Conall

### Startup Things
[ -z "$PS1" ] && return

# The all-important coloured prompt 
if [ "$HOSTNAME" = "catenary" ]
then
    PS1='\e]2;\u@\H \w\a\e[32m\u@\h \W \e[0m\$ '
elif [ "$HOSTNAME" = "spoon.netsoc.tcd.ie" ] or [ "$HOSTNAME" = "cube" ]
then
    PS1='\e]2;\u@\H \w\a\e[31m\u@\h \W \e[0m\$ '
fi
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

### Little shorthand aliases to make life easier

alias lock="xscreensaver-command -lock"
alias suspend='sudo pm-suspend'
alias scr="tmux attach" 


### Mountpoints and options are long and boring to type out

# keith and raid no longer work since keith became a Lion box
#alias keith='sudo mount -t cifs //keith/Warez /mnt/keith/ -o guest'
#alias raid='sudo mount -t cifs //keith/RAID /mnt/raid -o guest'

alias spoon='sshfs luigii@spoon: ~/spoon'


### External monitor commands for my 1080p monitor

alias monitoron='xrandr --output VGA-0 --mode 1920x1080 --right-of LVDS'
alias monitoroff='xrandr --output VGA-0 --off'


### Simple (better) default options

alias ls='ls --color=auto'
alias scrot="scrot /home/conall/images/screencaps/%Y-%m-%d-%R.png"
alias emacs='emacs -nw'
alias scr='screen -dr'
alias texi2pdf='texi2pdf --build=clean -q'
alias df='df -h'


### Non-proxy env variables

export COUNTRY='IE'
export EDITOR='emacs -nw'

# adding perl and sonata (ugh) to my path
PATH=$PATH:/usr/bin/site_perl:/opt/simili/bin:/opt/simili/tcl/bin
export PATH

# unlimited history, because why not?
unset HISTFILESIZE
export HISTFILESIZE

# history time format 
export HISTTIMEFORMAT='%F %T '

### Shopts
shopt -s histappend


### Proxies

# Proxies for a netsoc room ethernet connection
#export http_proxy="spoon.netsoc.tcd.ie:8000"
#export https_proxy="spoon.netsoc.tcd.ie:8000"
#export ftp_proxy="spoon.netsoc.tcd.ie:8000"

# Proxies for anywhere else in college
#export http_proxy="localhost:8080"
#export https_proxy="localhost:8080"
#export ftp_proxy="localhost:8080"
