#!/bin/sh

# DWM-style battery: just text, no icons
PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

if [ "$CHARGING" != "" ]; then
  sketchybar --set "$NAME" label="AC ${PERCENTAGE}%"
else
  sketchybar --set "$NAME" label="BAT ${PERCENTAGE}%"
fi
