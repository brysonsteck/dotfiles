#!/bin/sh 
# 
# 01-aliases.bash
# bryson's bash aliases
#

shopt -s expand_aliases

alias sudo="doas"

# typos
alias l='ls'
alias sl='ls'

# grep colors
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls color and shortcuts
alias ls='ls --color=auto'              
alias la='ls -a'
alias lsd='ls -lh'

# copy an entire file
alias copy='xclip -sel c <'

# cd shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias back='cd -'

# binary renames
alias java='/usr/local/java/jdk-18.0.1.1/bin/java'
alias java11='/usr/bin/java'
alias python='python3'
alias g++='g++ --std=c++20'
alias j='autojump'
alias vim='vim -p'

# quick important file edits
alias todo='vim ~/.todo/TODO.org'

# go to directory with files from iPhone
alias iPhone='cd /home/bryson/Downloads/from-iPhone'

# common combinations
alias gs='gs -dNOSAFER'
alias django='python manage.py'
alias smci='doas make clean install'
alias smi='doas make install'
#alias mount='sudo mount'
#alias umount='sudo umount'

# bash navigation
alias add-alias='vim ~/.bash/01-aliases.bash; . ~/.bash_profile'

# common portage files
alias package.use='doas vim /etc/portage/package.use'
alias make.conf='doas vim /etc/portage/make.conf'
alias package.license='doas vim /etc/portage/package.license'

# other garbage
alias fixwifi='sudo rc-service wpa_supplicant restart'
#alias spt="spotifyd && spt"
alias macos="cd /home/bryson/git/macOS-Simple-KVM && ./basic.sh"
alias server="python3 /home/bryson/git/webserver/server.py"
alias ssh-pixel="ssh -p 8022 uO_14O@${1}"
alias emerge-update="sudo emerge --ask --verbose --update --deep --changed-use @world"
#alias vim="nvim"
#alias connect='nmcli d wifi connect'
#alias listwifi='nmcli d wifi list'
