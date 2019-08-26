#!/bin/bash

OPTIONS="Display\nPower\nKill"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\r\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    Display)
      pkill rofi
      rofi -modi Display:$HOME/.config/rofi/display-menu.sh -show Display &
      ;;
    Power)
      pkill rofi
      rofi -modi Power:$HOME/.config/rofi/power-menu.sh -show Power &
      ;;
    Power)
        pkill rofi
        rofi -modi Kill:$HOME/.config/rofi/kill-menu.sh -show Kill &
        ;;
  esac
else
  echo -e $OPTIONS
fi
