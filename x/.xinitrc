# executed by startx
# for use when dingo is DOCKED

cd ~ &

# set up monitors
fixscreen &

# set default audio device to be dock audio jack
pacmd set-default-sink 1

# add weather, date and time to xsetroot
sh ~/bin/xsetloop-docked.sh &

# set up wallpapers
#wallpapers &

# start notifications daemon
notification-daemon &

# apply Xresources
xrdb -merge ~/.Xresources 

# make cursor disappear after a couple of seconds
unclutter --idle 4 -root &

# enable numlock
numlockx &

# start dwm
redshift -O3500; xset r rate 300 50; exec dwm
