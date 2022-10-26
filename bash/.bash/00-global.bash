#!/bin/sh
#
# 00-global.bash
# define global bash things
#

# expand history size
export HISTSIZE=100000

# source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

