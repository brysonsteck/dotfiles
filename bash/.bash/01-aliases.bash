#!/bin/sh 
# 
# 01-aliases.bash
# bryson's bash aliases
#

shopt -s expand_aliases

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
alias java='/usr/java/jdk-17.0.1/bin/java'
alias java8='/usr/java/jre1.8.0_291/bin/java'
alias java12='/usr/java/jdk-12.0.2/bin/java'
alias python='python3'
#alias vim='nvim'

# quick important file edits
alias todo='vim ~/TODO.md'

# go to directory with files from iPhone
alias iPhone='cd /home/bryson/Downloads/from-iPhone'

# common combinations
alias gs='gs -dNOSAFER'
alias django='python manage.py'
alias smci='sudo make clean install'
alias smi='sudo make install'
alias mount='sudo mount'
alias umount='sudo umount'

# bash navigation
alias add-alias='vim ~/.bash/01-aliases.bash; . ~/.bash_profile'

# other garbage
alias wifi='nmcli d wifi'
#alias connect='nmcli d wifi connect'
#alias listwifi='nmcli d wifi list'
