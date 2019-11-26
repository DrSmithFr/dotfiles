#!/bin/bash

export CURRENT_FOLDER="$( command cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# loading brigthness from file
BRIGHT=`cat "$CURRENT_FOLDER/brightness.txt"`

if [ "$1" = '+' ]; then
    NEWBRIGHT=$(echo "$BRIGHT + 0.05" | bc)
    if [ "$(echo "$NEWBRIGHT > 1.0" | bc)" -eq 1 ]; then
        NEWBRIGHT='1.0'
    fi
elif [ "$1" = '-' ]; then
    NEWBRIGHT=$(echo "$BRIGHT - 0.05" | bc)
    if [ "$(echo "$NEWBRIGHT < 0.0" | bc)" -eq 1 ]; then
        NEWBRIGHT='0.0'
    fi
else
  NEWBRIGHT=$(echo "$BRIGHT")
fi

EDP=$(xrandr | grep eDP | cut -d' ' -f1)
HDMI=$(xrandr | grep HDMI | cut -d' ' -f1)

# updating brigthness file
echo "$NEWBRIGHT" > "$CURRENT_FOLDER/brightness.txt"

xrandr --output "$EDP" --brightness "$NEWBRIGHT"
xrandr --output "$HDMI" --brightness "$NEWBRIGHT"
