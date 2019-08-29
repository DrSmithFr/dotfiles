#!/bin/bash

OPTIONS="(1) Enable\n(2) Disable"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\r\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    *Enable)
      xrandr --output HDMI-2 --right-of eDP-1 --auto
      notify-msg "HDMI enabled"
      ;;
    *Disable)
      xrandr --output HDMI-2 --off
      notify-msg "HDMI disabled"
      ;;
  esac
else
  echo -e $OPTIONS
fi
