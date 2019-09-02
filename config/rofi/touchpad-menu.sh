#!/bin/bash

OPTIONS="(1) Enable\n(2) Disable"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\r\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    1|*Enable)
      notify-send --urgency=critical --app-name=TouchPad -t 3000 "enabled"
      xinput --enable "ELAN1200:00 04F3:3044 Touchpad" &
      ;;
    2|*Disable)
      notify-send --urgency=critical --app-name=TouchPad -t 3000 "disabled"
      xinput --disable "ELAN1200:00 04F3:3044 Touchpad" &
      ;;
  esac
else
  echo -e $OPTIONS
fi
