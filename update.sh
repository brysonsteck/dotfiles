#!/bin/bash

cp ~/.alacritty.yml ./alacritty/.alacritty.yml
cp -r ~/.bash ./bash
cp ~/.bash_profile ./bash
cp ~/.bashrc ./bash
cp ~/.tmux.conf ./tmux
cp ~/.vimrc ./vim
cp ~/.vim/coc-settings.json ./vim
cp ~/.xinitrc* ./x
cp ~/.Xresources ./x

git submodule update --remote --merge

