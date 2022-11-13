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

# local apps
alias carmine-impact='cd /home/bryson/git/cardboard && ./cardboard_unix'
alias celeste='cd /home/bryson/apps/celeste && ./Celeste.bin.x86_64'
alias dont-move='cd /home/bryson/apps/dont-move && ./DontMove'
alias friday-night-funkin='cd /home/bryson/apps/friday-night-funkin && ./Funkin'
alias overland='cd /home/bryson/apps/overland && ./Overland.x86_64'
alias sm64ex='cd /home/bryson/git/sm64ex/build/us_pc/./sm64.us.f3dex2e'

# binary renames
alias java='/usr/local/java/jdk-18.0.1.1/bin/java'
alias java11='/usr/bin/java'
alias python='python3'
alias g++='g++ --std=c++20'
alias j='autojump'
alias vim='vim -p'
alias gs='gs -dNOSAFER'
#alias gdb="gdb --tui"
#alias spt="spotifyd && spt"

# quick important file edits
alias todo='vim ~/.todo/TODO.org'

# common combinations
alias django='python manage.py'
alias smci='sudo make clean install'
alias smi='sudo make install'
alias library='xrandr --output HDMI-A-0 --auto --set TearFree on --output eDP --off && xset r rate 300 50'
alias nolibrary='xrandr --output HDMI-A-0 --off --output eDP --auto'

# bash navigation
alias add-alias='vim ~/.bash/01-aliases.bash; . ~/.bash_profile'

function search() {
  find . -type f -exec grep ${1} {} \;
}

function ssh-pixel() {
  ssh -p 8022 uO_14O@${1}
}

# common portage files
alias package.use='sudo vim /etc/portage/package.use'
alias make.conf='sudo vim /etc/portage/make.conf'
alias package.license='sudo vim /etc/portage/package.license'

# other garbage
alias fixwifi='sudo rc-service wpa_supplicant restart'
alias fixaudio='pacmd set-default-sink alsa_output.usb-0c76_USB_PnP_Audio_Device-00.analog-stereo'
alias macos="cd /home/bryson/git/macOS-Simple-KVM && ./basic.sh"
alias server="python3 /home/bryson/git/webserver/server.py"
alias emerge-update="sudo emerge --ask --verbose --update --deep --changed-use @world"

