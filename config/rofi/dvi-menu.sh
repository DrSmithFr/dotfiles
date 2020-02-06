#!/bin/bash

EDP=$(xrandr | grep eDP | cut -d' ' -f1)
HDMI=$(xrandr | grep HDMI | cut -d' ' -f1)
DVI=$(xrandr | grep DVI | cut -d' ' -f1)

OPTIONS="(1) Left EDP\n(2) Above EDP\n(3) Right EDP\n(4) Left HDMI\n(5) Above HDMI\n(6) Right HDMI\n(7) None"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\r\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    1|*'Left EDP')
      notify-send --urgency=critical --app-name=DVI -t 3000 "enabled - Left of EDP"
      xrandr --output $DVI --left-of $EDP --auto
      ;;
    2|*'Above EDP')
      notify-send --urgency=critical --app-name=DVI -t 3000 "enabled - Above EDP"
      xrandr --output $DVI --above $EDP --auto
      ;;
    3|*'Right EDP')
      notify-send --urgency=critical --app-name=DVI -t 3000 "enabled - Right of EDP"
      xrandr --output $DVI --right-of $EDP --auto
      ;;
    4|*'Left HDMI')
      notify-send --urgency=critical --app-name=DVI -t 3000 "enabled - Left of HDMI"
      xrandr --output $DVI --left-of $HDMI --auto
      ;;
    5|*'Above HDMI')
      notify-send --urgency=critical --app-name=DVI -t 3000 "enabled - Above HDMI"
      xrandr --output $DVI --above $HDMI --auto
      ;;
    6|*'Right HDMI')
      notify-send --urgency=critical --app-name=DVI -t 3000 "enabled - Right of HDMI"
      xrandr --output $DVI --right-of $HDMI --auto
      ;;
    7|*None)
      notify-send --urgency=critical --app-name=DVI -t 3000 "disabled"
      xrandr --output $DVI --off
      ;;
  esac
else
  echo -e $OPTIONS
fi
