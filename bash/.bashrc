# get custom bash scripts
if [[ -d ~/.bash/ ]]; then
  for f in ~/.bash/*; do source $f; done
fi

# install asdf
#. $HOME/.asdf/asdf.sh
#. $HOME/.asdf/completions/asdf.bash

# devkitpro
DEVKITPRO=/opt/devkitpro
DEVKITARM=/opt/devkitpro/devkitARM
DEVKITPPC=/opt/devkitpro/devkitPPC
export PATH=$PATH:/home/bryson/.spicetify
