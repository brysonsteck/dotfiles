#!/bin/sh
#
# 02-prompt.bash
# bryson's gnarly bash prompt config
#

# color definitions
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

# 256color prompt variables
color1='\e[38;5;39m'
color2='\e[38;5;81m'
color3='\e[38;5;77m'
color4='\e[38;5;226m'

# return exit code of last program if not 0
function exit_code() {
  local ERROR="$?"
  if [[ ERROR -ne 0 ]]; then
    echo -n ' \['"$RED"'\]'"$ERROR"''
  fi
}

# get current git branch and status
# http://www.opinionatedprogrammer.com/2011/01/colorful-bash-prompt-reflecting-git-status/
function _git_prompt() {
  local git_status="`git status -unormal 2>&1`"
  if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
    if [[ "$git_status" =~ nothing\ to\ commit ]]; then
      local ansi=""
      local color="$lgreen"
    elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
      local ansi="!"
      local color="$lred"
    else
      local ansi="*"
      local color="$lyellow"
    fi
    if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
      branch=${BASH_REMATCH[1]}
    else
      # Detached HEAD.  (branch=HEAD is a faster alternative.)
      branch="`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
      echo local`"
    fi
    if ! [[ "$branch" =~ local ]]; then
      echo -n '\['"$color"'\] { git: '"$ansi"''"$branch"' } '
    fi
  fi
}

# prompt building
# (2 unicode)[ bryson@hostname ] { /current/path }
# (unicode) $
#export _PS1="\[$dgray\]╭─[ \[$LGREEN\]\u\[$lgray\]@\[$YELLOW\]\h\[$dgray\] ] {\[$LBLUE\] \w\[$dgray\] } "
#export _PS2="\[$dgray\]╰ "

# same as above, no unicode
#export _PS1="\[$dgray\][ \[$GREEN\]\u\[$lgray\]@\[$LRED\]\h\[$dgray\] ] { \[$LCYAN\]\w\[$dgray\] } "

# bryson@hostname /current/path/ bash 10:00:00 PM
#export _PS1="\[\e[1m$color1\]\u\[$color2\]@\[$color3\]\h \[$color4\]\w \[$color3\]\@ \[$color2\]\s "

# [ bryson@hostname /current/path ]
# $
#export _PS1="\[$lgray\][ \[\e[1m$color1\]\u\[$color2\]@\[$color3\]\h \[$color4\]\w \[\e[0m$lgray\]]"
#export _PS1="\[\e[$lgray\][ \[$LBLUE\]\u\[$lcyan\]@\[$GREEN\]\h \[$LYELLOW\]\w \[$lgray\]]"
#export _PS2="\[$dgray\]"

# [ bryson@hostname path ]
# $
export _PS1="\[\e[$lgray\][ \[$LBLUE\]\u\[$lcyan\]@\[$GREEN\]\h \[$LYELLOW\]\W \[$lgray\]]"
export _PS2="\[$dgray\]"

# define x titlebar
TITLEBAR='\[\033]0;\u@\h:\w ($(history 1 | cut -c 8-))\]'

# apply prompt and functions
export PROMPT_COMMAND='export PS1="$TITLEBAR${_status}${_PS1}$(exit_code)$(_git_prompt)\n${_PS2}\[$NC\]\$ "'

