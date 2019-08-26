#!/bin/bash

OPTIONS="(1) Display\n(2) Kill\n(3) Power"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    1|*Display)
      pkill rofi
      rofi -modi Display:$HOME/.config/rofi/display-menu.sh -show Display &
      ;;
    2|*Kill)
      pkill rofi
      rofi -modi Kill:$HOME/.config/rofi/kill-menu.sh -show Kill &
      ;;
    3|*Power)
      pkill rofi
      rofi -modi Power:$HOME/.config/rofi/power-menu.sh -show Power &
      ;;
  esac
else
  echo -e $OPTIONS
fi
