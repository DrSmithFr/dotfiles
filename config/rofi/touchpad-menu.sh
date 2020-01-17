#!/bin/bash

function applyToPads() {
    OLDIFS="$IFS"
    IFS=$'\n'
    for pad in $(xinput list --name-only | grep --color=never pad); do
      xinput "--$1" "$pad" &
    done
    IFS="$OLDIFS"
}

OPTIONS="(1) Enable\n(2) Disable"
option=`echo -e $OPTIONS | awk '{print $1}' | tr -d '\r\n\t'`

selected=$@

if [ "$selected" ]
then
  case $selected in
    1|*Enable)
      notify-send --urgency=critical --app-name=TouchPad -t 3000 "enabled"
      applyToPads enable
      ;;
    2|*Disable)
      notify-send --urgency=critical --app-name=TouchPad -t 3000 "disabled"
      applyToPads disable
      ;;
  esac
else
  echo -e $OPTIONS
fi
