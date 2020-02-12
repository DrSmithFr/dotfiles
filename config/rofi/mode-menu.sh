#!/bin/bash

function applyToPads() {
    OLDIFS="$IFS"
    IFS=$'\n'
    for pad in $(xinput list --name-only | grep --color=never pad); do
      xinput "--$1" "$pad" &
    done
    IFS="$OLDIFS"
}

EDP=$(xrandr | grep eDP | cut -d' ' -f1)
HDMI=$(xrandr | grep HDMI | cut -d' ' -f1)
DVI=$(xrandr | grep DVI | cut -d' ' -f1)

OPTIONS="(1) Workstation\n(2) Dual-screen\n(3) Laptop"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\r\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    1|*'Workstation')
        notify-send --urgency=critical --app-name=HDMI -t 3000 "Mode: Workstation"
        xrandr --output $HDMI --left-of $EDP --auto
        xrandr --output $DVI --left-of $HDMI --auto
        applyToPads disable
        ;;
    2|*'Dual-screen')
      notify-send --urgency=critical --app-name=DVI -t 3000 "Mode: Dual-screen"
      xrandr --output $HDMI --left-of $EDP --auto
      xrandr --output $DVI --off
      applyToPads disable
      ;;
    3|*'Laptop')
      notify-send --urgency=critical --app-name=DVI -t 3000 "Mode: Laptop"
      xrandr --output $HDMI --off
      xrandr --output $DVI --off
      applyToPads enable
      ;;
  esac
else
  echo -e $OPTIONS
fi
