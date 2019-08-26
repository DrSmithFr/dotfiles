#!/bin/bash

OPTIONS="(1) Lock\n(2) Logout\n(3) Shutdown\n(4) Reboot"

option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\r\n\t'`
if [ "$@" ]
then
  case $@ in
    1|*Lock)
        pkill rofi
        i3lock-fancy --text="" && \
        amixer -D pulse set Master mute && \
        dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
        ;;
    2|*Logout)
      i3-msg exit
      ;;
    3|*Shutdown)
      shutdown now
      ;;
    5|*Reboot)
      reboot
      ;;
  esac
else
echo -e $OPTIONS
fi
