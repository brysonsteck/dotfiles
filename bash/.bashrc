# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Alias stuffs
shopt -s expand_aliases

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls='ls --color=auto'              
alias la='ls -a'
alias lsd='ls -lh'

alias record-audio='ffmpeg -f pulse -i default'
alias python='python3'
alias alsamixer='alsamixer -c 1'
#discord_gpu() {
#        ~/bin/discord "$@"
#}
#export -f discord_gpu
alias discord='discord --ignore-gpu-blocklist --disable-features=UseOzonePlatform --enable-features=VaapiVideoDecoder --use-gl=desktop --enable-gpu-rasterization --enable-zero-copy'

#alias current-command='echo $BASH_COMMAND'

#echo -en "\033]0;\u@\h - $(history | cut -c 8-)\a"

TITLEBAR='\[\033]0;\u at \h in \w ($(history 1 | cut -c 8-))\]'

#set-window-title() {
#      echo -en "\033]0;\u@\h - $(history | cut -c 8-)\a"
#}

#if [[ "$PROMPT_COMMAND" ]]; then
#      export PROMPT_COMMAND="$PROMPT_COMMAND;set-window-title"
#else
#      export PROMPT_COMMAND=set-window-title
#fi

#
# Define some colors first: Capitals denote bold
#
black='\e[0;30m'
BLACK='\e[1;30m'
dgray='\e[0;90m'
DGRAY='\e[1;90m'
red='\e[0;31m'
RED='\e[1;31m'
lred='\e[0;91m'
LRED='\e[1;91m'
green='\e[0;32m'
GREEN='\e[1;32m'
lgreen='\e[0;92m'
LGREEN='\e[1;92m'
yellow='\e[0;33m'
YELLOW='\e[1;33m'
lyellow='\e[0;93m'
LYELLOW='\e[1;93m'
blue='\e[0;34m'
BLUE='\e[1;34m'
lblue='\e[0;94m'
LBLUE='\e[1;94m'
magenta='\e[0;35m'
MAGENTA='\e[1;35m'
lmagenta='\e[0;95m'
LMAGENTA='\e[1;95m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
lcyan='\e[0;96m'
LCYAN='\e[1;96m'
lgray='\e[0;37m'
LGRAY='\e[1;37m'
NC='\e[0m' # No Color

# Taken from http://www.opinionatedprogrammer.com/2011/01/colorful-bash-prompt-reflecting-git-status/
function _git_prompt() {
  local git_status="`git status -unormal 2>&1`"
  if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
    if [[ "$git_status" =~ nothing\ to\ commit ]]; then
      local ansi=$GREEN
    elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
      local ansi=$RED
    else
      local ansi=$YELLOW
    fi
    if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
      branch=${BASH_REMATCH[1]}
      #test "$branch" != master || branch=' '
    else
      # Detached HEAD.  (branch=HEAD is a faster alternative.)
      branch="`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
      echo local`"
    fi
    if ! [[ "$branch" =~ local ]]; then
      echo -n '\['"$ansi"'\](in git branch '"$branch"') '
    fi
  fi
}

function report_status() {
  RET_CODE=$?
  if [[ $RET_CODE -ne 0 ]] ; then
    echo -ne "[\[$RED\]$RET_CODE\[$NC\]]"
  fi
}

#export _PS1="\[$RED\]\u\[$NC\]@\[$YELLOW\]\h \[$yellow\]\w | \[$GREEN\]\V\s \[$BLUE\]\d \@ \[$NC\]"
export _PS1="\[$LGREEN\]\u \[$dgray\]at \[$YELLOW\]\h \[$dgray\]in \[$LMAGENTA\]\w "
export PROMPT_COMMAND='export PS1="$TITLEBAR${_status}${_PS1}$(_git_prompt)\[$NC\]\$ "'