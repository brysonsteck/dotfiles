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

# binary renames
alias java='/usr/java/jdk-17.0.1/bin/java'
alias java8='/usr/java/jre1.8.0_291/bin/java'
alias java12='/usr/java/jdk-12.0.2/bin/java'
alias python='python3'

# quick important file edits
alias todo='vim ~/TODO.md'

# go to directory with files from iPhone
alias iPhone='cd /home/bryson/Downloads/from-iPhone'

# common combinations when programming
alias gs='gs -dNOSAFER'
alias django='python manage.py'
alias smci='sudo make clean install'
