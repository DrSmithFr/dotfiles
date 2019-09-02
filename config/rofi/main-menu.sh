#!/bin/bash

OPTIONS="(1) HDMI\n(2) TouchPad\n(3) Power\n(4) Bluetooth"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    1|*HDMI)
      pkill rofi
      rofi -modi HDMI:$HOME/.config/rofi/display-menu.sh -show HDMI &
      ;;
    2|*TouchPad)
      pkill rofi
      rofi -modi TOUCH:$HOME/.config/rofi/touchpad-menu.sh -show TOUCH &
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
