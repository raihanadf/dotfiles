#!/bin/bash

# needed :
# - pamixer
# - pactl

msgID="100" # Arbitrary, can be anything
iconPath="/home/raihan/.dotfiles/scripts/cat"

case "$1" in
  "up")
    pactl set-sink-volume @DEFAULT_SINK@ +4%
    ;;

  "down")
    pactl set-sink-volume @DEFAULT_SINK@ -4%
    ;;

  "mute")
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
esac

isMuted="$(pamixer --get-mute)"
volume="$(pamixer --get-volume)"

if [ "$isMuted" = "false" ]; then
  if [ "$volume" -gt "100" ]; then
    dunstify "Sound" "Volume: [ $volume%]" -h int:value:"$volume" -h string:fgcolor:#ff4444 -h string:frcolor:#ba0606 -i $iconPath/audio-volume-overamplified-symbolic.svg -r $msgID
  elif [ "$volume" -gt "65" ]; then
    dunstify "Sound" "Volume: [ $volume%]" -h int:value:"$volume" -h string:fgcolor:#989719 -i $iconPath/audio-volume-high-symbolic.svg -r $msgID
  elif [ "$volume" -gt "20" ]; then
    dunstify "Sound" "Volume: [ $volume%]" -h int:value:"$volume" -h string:fgcolor:#989719 -i $iconPath/audio-volume-medium-symbolic.svg -r $msgID
  elif [ "$volume" -gt "0" ]; then
    dunstify "Sound" "Volume: [ $volume%]" -h int:value:"$volume" -h string:fgcolor:#989719 -i $iconPath/audio-volume-low-symbolic.svg -r $msgID
  elif [ "$volume" == "0" ]; then
    dunstify "Volume Muted" -h string:fgcolor:#989719 -i $iconPath/audio-volume-muted-symbolic.svg -r $msgID
  fi
else
  dunstify "Volume Muted" -h string:fgcolor:#989719 -i $iconPath/audio-volume-mute.png -r $msgID
fi

