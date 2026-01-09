#!/bin/sh

# DWM-style clock: day mon dd HH:MM
# Classic suckless format
sketchybar --set "$NAME" label="$(date '+%a %b %d %H:%M')"
