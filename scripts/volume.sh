#!/bin/bash

# Dependencies
# - pamixer
# - pactl
# - ePapirus (icon)
msgID="92374" # Arbitrary, can be anything
iconPath="/usr/share/icons/ePapirus/48x48/status"

case "$1" in
  "up")
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    ;;

  "down")
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;

  "mute")
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
esac

isMuted="$(pamixer --get-mute)"
volume="$(pamixer --get-volume)"

if [ "$isMuted" = "false" ]; then
  if [ "$volume" -gt "100" ]; then
    dunstify "Volume $volume%" -h int:value:"$volume" -h string:fgcolor:#ff4444 -h string:frcolor:#ff4444 -i $iconPath/notification-audio-volume-high.svg -r $msgID
  elif [ "$volume" -gt "65" ]; then
    dunstify "Volume $volume%" -h int:value:"$volume" -i $iconPath/notification-audio-volume-high.svg -r $msgID
  elif [ "$volume" -gt "20" ]; then
    dunstify "Volume $volume%" -h int:value:"$volume" -i $iconPath/notification-audio-volume-medium.svg -r $msgID
  elif [ "$volume" -gt "0" ]; then
    dunstify "Volume $volume%" -h int:value:"$volume" -i $iconPath/notification-audio-volume-low.svg -r $msgID
  elif [ "$volume" == "0" ]; then
    dunstify "Volume Muted" -i $iconPath/notification-audio-volume-muted.svg -r $msgID
  fi
else
  dunstify "Volume Muted" -i $iconPath/notification-audio-volume-muted.svg -r $msgID
fi

canberra-gtk-play -i audio-volume-change -d "changeVolume"


