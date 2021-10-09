# executed by startx
# for use when dingo is DOCKED

cd ~ &

# set up monitors
fixscreen &

# add weather, date and time to xsetroot
sh ~/bin/xsetloop-docked.sh &

# set up wallpapers
wallpapers &

# apply Xresources
xrdb -merge ~/.Xresources &

# start dwm
redshift -O3500; xset r rate 300 50; exec dwm
