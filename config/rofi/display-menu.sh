#!/bin/bash

EDP=$(xrandr | grep eDP | cut -d' ' -f1)
HDMI=$(xrandr | grep HDMI | cut -d' ' -f1)
DVI=$(xrandr | grep DVI | cut -d' ' -f1)

OPTIONS="(1) Left\n(2) Above\n(3) Right\n(4) None"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\r\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    1|*Left)
      notify-send --urgency=critical --app-name=HDMI -t 3000 "enabled - Left"
      xrandr --output $HDMI --left-of $EDP --auto
      xrandr --output $DVI --left-of $HDMI --auto
      ;;
    2|*Above)
      notify-send --urgency=critical --app-name=HDMI -t 3000 "enabled - Above"
      xrandr --output $HDMI --above $EDP --auto
      xrandr --output $DVI --above $HDMI --auto
      ;;
    3|*Right)
      notify-send --urgency=critical --app-name=HDMI -t 3000 "enabled - Right"
      xrandr --output $HDMI --right-of $EDP --auto
      xrandr --output $DVI --right-of $HDMI --auto
      ;;
    4|*None)
      notify-send --urgency=critical --app-name=HDMI -t 3000 "disabled"
      xrandr --output $HDMI --off
      xrandr --output $DVI --off
      ;;
  esac
else
  echo -e $OPTIONS
fi
