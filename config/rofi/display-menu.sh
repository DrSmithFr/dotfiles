#!/bin/bash

OPTIONS="(1) Enable\n(2) Disable"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\r\n\t'`

selected=$@

if [ "$selected" ]
then
	case $selected in
		*Enable)
			xrandr --output HDMI-2 --right-of eDP-1 --auto, mode "default"
      notify-msg "working"
			;;
		*Disable)
			xrandr --output HDMI-2 --off, mode "default"
			;;
	esac
else
	echo -e $OPTIONS
fi
