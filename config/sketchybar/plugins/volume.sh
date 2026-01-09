#!/bin/sh

# DWM-style volume: just text
if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  if [ "$VOLUME" = "0" ]; then
    sketchybar --set "$NAME" label="VOL MUTE"
  else
    sketchybar --set "$NAME" label="VOL ${VOLUME}%"
  fi
fi
