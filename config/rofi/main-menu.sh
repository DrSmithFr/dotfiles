#!/bin/bash

OPTIONS="(1) HDMI\n(2) Kill\n(3) Power\n(4) Bluetooth"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    1|*HDMI)
      pkill rofi
      rofi -modi HDMI:$HOME/.config/rofi/display-menu.sh -show HDMI &
      ;;
    2|*Kill)
      pkill rofi
      rofi -modi Kill:$HOME/.config/rofi/kill-menu.sh -show Kill &
      ;;
    3|*Power)
      pkill rofi
      rofi -modi Power:$HOME/.config/rofi/power-menu.sh -show Power &
      ;;
    3|*Bluetooth)
      pkill rofi
      blueman-manager &
      ;;
  esac
else
  echo -e $OPTIONS
fi
