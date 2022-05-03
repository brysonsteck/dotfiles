#!/bin/sh
#
# 03-boot.bash
# startup scripts for systems
#

# run startup script if tty
# for dingo
if [[ $TERM == 'linux' && $(hostname) == 'dingo' ]]; then
    cat ~/bin/house.txt
    printf "\n${CYAN}Welcome back Bryson :)\n\n"
    printf "${LGREEN}What should dingo do?\n${blue}"
    echo -e '\td: start docked\n\tn: start not docked\n\tq: shutdown\n\tr: reboot\n\tl: logout\n\tb: bash\n\n'

  while read -rs -N 1 key; do
    printf "${NC}"
    case $key in
      d) startx ;;
      n) nstartx.sh ;;
      q) echo "Are you sure you want to shutdown? (y/n)";
      read -rs -N 1 key2; case $key2 in y) shutdown now ;; esac; ;;
      r) echo "Are you sure you want to reboot? (y/n)";
      read -rs -N 1 key3; case $key3 in y) reboot ;; esac; ;;
      l) logout ;;
      b) break ;;
      [h?]) echo "$USAGE";;
    esac
    clear
    printf "\n${red}Please try again...${NC}\n\n${LGREEN}What should dingo do now?\n${blue}"
    echo -e '\td: start docked\n\tn: start not docked\n\tq: shutdown\n\tr: reboot\n\tl: logout\n\tb: bash\n\n'
  done
fi

