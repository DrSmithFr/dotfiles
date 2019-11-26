#!/bin/bash

EDP=$(xrandr | grep eDP | cut -d' ' -f1)
HDMI=$(xrandr | grep HDMI | cut -d' ' -f1)

OPTIONS="(1) Above\n(2) Right\n(3) Left\n(4) None"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\r\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    1|*Above)
      notify-send --urgency=critical --app-name=HDMI -t 3000 "enabled - Above"
      xrandr --output $HDMI --above $EDP --auto
      ;;
    2|*Right)
      notify-send --urgency=critical --app-name=HDMI -t 3000 "enabled - Right"
      xrandr --output $HDMI --right-of $EDP --auto
      ;;
    3|*Left)
      notify-send --urgency=critical --app-name=HDMI -t 3000 "enabled - Left"
      xrandr --output $HDMI --left-of $EDP --auto
      ;;
    4|*None)
      notify-send --urgency=critical --app-name=HDMI -t 3000 "disabled"
      xrandr --output $HDMI --off
      ;;
  esac
else
  echo -e $OPTIONS
fi
