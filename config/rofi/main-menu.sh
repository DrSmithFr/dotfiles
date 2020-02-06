#!/bin/bash

OPTIONS="(1) HDMI\n(2) DVI\n(3) TouchPad\n(4) Bluetooth\n(5) Power"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    1|*HDMI)
      pkill rofi
      rofi -modi HDMI:$HOME/.config/rofi/hdmi-menu.sh -show HDMI &
      ;;
    2|*DVI)
      pkill rofi
      rofi -modi HDMI:$HOME/.config/rofi/dvi-menu.sh -show DVI &
      ;;
    3|*TouchPad)
      pkill rofi
      rofi -modi TOUCH:$HOME/.config/rofi/touchpad-menu.sh -show TOUCH &
      ;;
    4|*Bluetooth)
      pkill rofi
      blueman-manager &
      ;;
    5|*Power)
      pkill rofi
      rofi -modi Power:$HOME/.config/rofi/power-menu.sh -show Power &
      ;;
  esac
else
  echo -e $OPTIONS
fi
