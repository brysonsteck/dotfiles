#!/bin/bash

# bash
if [[ -d $HOME/.bash ]]; then
  mv $HOME/.bash $HOME/.bash.old
fi
if [[ -f $HOME/.bash_profile ]]; then
  mv $HOME/.bash_profile $HOME/.bash_profile.old
fi
if [[ -f $HOME/.bashrc ]]; then
  mv $HOME/.bashrc $HOME/.bashrc.old
fi
ln -s ./bash/.bash $HOME/.bash
ln -P ./bash/.bash_profile $HOME/.bash_profile
ln -P ./bash/.bashrc $HOME/.bashrc
source $HOME/.bash_profile

echo "Linked bash. Press [ENTER] to link x stuff (alacritty, firefox, xinit). Otherwise press ^C"
read

