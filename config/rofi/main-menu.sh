#!/bin/bash

OPTIONS="(1) MODE\n(2) HDMI\n(3) DVI\n(4) TouchPad\n(5) Bluetooth\n(6) Power"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    1|*MODE)
        pkill rofi
        rofi -modi MODE:$HOME/.config/rofi/mode-menu.sh -show MODE &
        ;;
    2|*HDMI)
      pkill rofi
      rofi -modi HDMI:$HOME/.config/rofi/hdmi-menu.sh -show HDMI &
      ;;
    3|*DVI)
      pkill rofi
      rofi -modi DVI:$HOME/.config/rofi/dvi-menu.sh -show DVI &
      ;;
    4|*TouchPad)
      pkill rofi
      rofi -modi TOUCH:$HOME/.config/rofi/touchpad-menu.sh -show TOUCH &
      ;;
    5|*Bluetooth)
      pkill rofi
      blueman-manager &
      ;;
    6|*Power)
      pkill rofi
      rofi -modi Power:$HOME/.config/rofi/power-menu.sh -show Power &
      ;;
  esac
else
  echo -e $OPTIONS
fi
