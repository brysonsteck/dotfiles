#!/bin/sh
#
# 03-boot.bash
# startup scripts for systems

bat_check() {
  TEST=$(acpi | grep "Dis")

  if [[ $? -eq 0 ]]; then 
    echo "***********************************************************"
    echo "                         WARNING"
    echo "***********************************************************"
    echo "Power supply is not plugged in."
    echo "Make sure it is plugged in to avoid a random shutdown."
    read -rs -N 1 -p "Press [Enter] to continue, any other key to return..." input;
    if grep -q "$input" <<< ""; then
      echo ""
    else
      return 1
    fi
  fi
}

# run startup script if tty
# for dingo
if [[ $TERM == 'linux' && $(hostname) == 'dingo' ]]; then
    cat ~/bin/house.txt
    printf "\n${CYAN}Welcome back Bryson :)\n\n"
    printf "${LGREEN}What should dingo do?\n${magenta}"
    echo -e '\td: start docked\n\tn: start not docked\n\tq: shutdown\n\tr: reboot\n\tl: logout\n\tb: bash\n\n'

  while read -rs -N 1 key; do
    printf "${NC}"
    case $key in
      d) bat_check && startx ;;
      n) nstartx.sh ;;
      q) echo "Are you sure you want to shutdown? (y/n)";
      read -rs -N 1 key2; case $key2 in y) doas shutdown -Ph now ;; esac; ;;
      r) echo "Are you sure you want to reboot? (y/n)";
      read -rs -N 1 key3; case $key3 in y) doas reboot ;; esac; ;;
      l) logout ;;
      b) break ;;
      [h?]) echo "$USAGE";;
    esac
    clear
    cat ~/bin/house.txt
    printf "\n${LGREEN}What should dingo do now?\n${magenta}"
    echo -e '\td: start docked\n\tn: start not docked\n\tq: shutdown\n\tr: reboot\n\tl: logout\n\tb: bash\n\n'
  done
fi

