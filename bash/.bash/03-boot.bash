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
    USAGE="${blue}\td:start-docked\n\tn:start-not-docked\n\tq:shutdown\n\tr:reboot\n\tb:bash\n\n${NC}"
    printf "${LGREEN}What should dingo do?\n"
    printf "%b" $USAGE

  while read -rs -N 1 key; do
    case $key in
      d) startx ;;
      n) nstartx.sh ;;
      q) echo "Are you sure you want to shutdown? (y/n)";
      read -rs -N 1 key2; case $key2 in y) shutdown now ;; esac; ;;
      r) echo "Are you sure you want to reboot? (y/n)";
      read -rs -N 1 key3; case $key3 in y) reboot ;; esac; ;;
      b) break ;;
      [h?]) echo "$USAGE";;
    esac
    printf "${LGREEN}What should dingo do now?\n"
    printf "%b" $USAGE
  done
fi

