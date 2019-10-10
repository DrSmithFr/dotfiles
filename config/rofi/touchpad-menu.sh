#!/bin/bash

OPTIONS="(1) Enable\n(2) Disable"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\r\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    1|*Enable)
      notify-send --urgency=critical --app-name=TouchPad -t 3000 "enabled"
      xinput --enable "CUST0001:00 04F3:30AA Touchpad" &
      ;;
    2|*Disable)
      notify-send --urgency=critical --app-name=TouchPad -t 3000 "disabled"
      xinput --disable "CUST0001:00 04F3:30AA Touchpad" &
      ;;
  esac
else
  echo -e $OPTIONS
fi
