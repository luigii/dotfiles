### Conall's bash configuration

### Startup Things
[ -z "$PS1" ] && return

# The all-important coloured prompt 
if [ "$USER" = "conall" ]
then
#    PS1='\e]2;\u@\H \w\a\e[32m\u@\h \W \e[0m\$ '
    PS1='\[\e[38;5;2m\]\u@\h \W \[\e[0m\]\$ '
elif [ "$USER" = "luigii" ]
then
#    PS1='\e]2;\u@\H \w\a\e[35m\u@\h \W \e[0m\$ '
    PS1='\[\e[38;5;6m\]\u@\h \W \[\e[0m\]\$ '
fi

export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

if [ -f /etc/bash_completion ] 
then
    . /etc/bash_completion
fi

### Little shorthand aliases to make life easier

alias lock="xscreensaver-command -lock"
alias suspend='sudo pm-suspend'
alias scr="tmux -2 attach" 


### Mountpoints and options are long and boring to type out

alias spoon='sshfs luigii@spoon: ~/spoon'


### External monitor commands for my 1080p monitor
### (not sure if I'll ever use this again, but I'll keep it here)

alias monitoron='xrandr --output VGA-0 --mode 1920x1080 --right-of LVDS'
alias monitoroff='xrandr --output VGA-0 --off'


### Simple (better) default options

alias ls='ls --color=auto'
alias scrot="scrot /home/conall/images/screencaps/%Y-%m-%d-%R.png"
alias emacs='emacsclient -t'
alias texi2pdf='texi2pdf --build=clean -q'
alias df='df -h'


### Non-proxy env variables

export COUNTRY='IE'
export LANG=en_IE.UTF-8
export EDITOR='emacsclient -t -a ""'
export ALTERNATE_EDITOR=""
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

# adding perl and sonata (ugh) to my path
PATH=$PATH:/usr/bin/site_perl:/opt/simili/bin:/opt/simili/tcl/bin:/usr/lib/openssh
export PATH

# unlimited history, because why not?
unset HISTFILESIZE
export HISTFILESIZE
unset HISTSIZE
export HISTSIZE

# history time format 
export HISTTIMEFORMAT='%F %T '

# Ignore commands starting with a space
export HISTCONTROL=ignorespace

### Shopts
shopt -s histappend


### Proxies

# Proxies for a netsoc room ethernet connection
#export http_proxy="spoon.netsoc.tcd.ie:8000"
#export https_proxy="spoon.netsoc.tcd.ie:8000"
#export ftp_proxy="spoon.netsoc.tcd.ie:8000"

# Proxies for anywhere else in college
# export http_proxy="localhost:8080"
# export https_proxy="localhost:8080"
# export ftp_proxy="localhost:8080"
# export socks_proxy="localhost:8080"
