#!/bin/sh
# executed by startx
# for use when dingo is DOCKED

# load xinitrc.d stuff

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# open picom compositor
picom -CG -I 0.1 -O 0.1 -o 0.0 --backend xrender --vsync --menu-opacity 1.0 & 

# set up monitors
#fixscreen
sh ~/.screenlayout/screenlayout.sh &

# set default audio device to be dock audio jack
pacmd set-default-sink alsa_output.usb-0c76_USB_PnP_Audio_Device-00.analog-stereo &

# add weather, date and time to xsetroot
#sh ~/bin/xsetloop-docked.sh &
slstatus &

# set up wallpapers
wallpapers.sh &

# start notifications daemon
notification-daemon &

# apply Xresources
xrdb -merge ~/.Xresources

# make cursor disappear after a couple of seconds
unclutter --idle 4 -root &

# enable numlock
numlockx &

# turn off wifi, force ethernet
nmcli radio wifi off &

# start dwm
xset r rate 300 50; exec dwm
#exec /home/bryson/bin/startdwm

