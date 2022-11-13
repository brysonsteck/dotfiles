# .bash_profile

PATH=$PATH:$HOME/.local/bin:$HOME/bin:$HOME/.cargo/bin

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
#. /usr/share/autojump/autojump.bash

export PATH
complete -cf doas
export PATH=$PATH:/home/bryson/.spicetify
#source "/home/bryson/git/emsdk/emsdk_env.sh"
