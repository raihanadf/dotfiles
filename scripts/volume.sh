#!/bin/bash

# needed :
# - pamixer
# - pactl

msgID="100" # Arbitrary, can be anything
iconPath="/home/raihan/.dotfiles/scripts/cat"
message=""

volume="$(pamixer --get-volume)"
check_volume ()
{
# biar gak ganjil
if [ $(($volume % 2)) != 0 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +1%
fi
	
}

case "$1" in
  "up")
    check_volume
    # biar max 115
    if [ "$volume" == "110" ]; then
        pactl set-sink-volume @DEFAULT_SINK@ 110%
    else
        pactl set-sink-volume @DEFAULT_SINK@ +2%
    fi
    ;;

  "down")
    pactl set-sink-volume @DEFAULT_SINK@ -2%
    check_volume
    ;;

  "mute")
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
esac

isMuted="$(pamixer --get-mute)"
volume="$(pamixer --get-volume)"

check_volume ()
{
# biar gak ganjil
if [ $(($volume % 2)) != 0 ]; then
    pactl set-sink-volume @DEFAULT_SINK@ +1%
fi
	
}

if [ "$isMuted" = "false" ]; then
  if [ "$volume" -gt "100" ]; then
    dunstify "Sound" "Volume: [ $volume%]" -h int:value:"$volume" -h string:fgcolor:#ff4444 -h string:frcolor:#ba0606 -i $iconPath/audio-volume-overamplified-symbolic.svg -r $msgID
  elif [ "$volume" -gt "75" ]; then
    dunstify "Sound" "Volume: [ $volume%]" -h int:value:"$volume" -h string:fgcolor:#989719 -i $iconPath/audio-volume-high-symbolic.svg -r $msgID
  elif [ "$volume" -gt "40" ]; then
    dunstify "Sound" "Volume: [ $volume%]" -h int:value:"$volume" -h string:fgcolor:#989719 -i $iconPath/audio-volume-medium-symbolic.svg -r $msgID
  elif [ "$volume" -gt "0" ]; then
    dunstify "Sound" "Volume: [ $volume%]" -h int:value:"$volume" -h string:fgcolor:#989719 -i $iconPath/audio-volume-low-symbolic.svg -r $msgID
  elif [ "$volume" == "0" ]; then
    dunstify "Volume Muted" -h string:fgcolor:#989719 -i $iconPath/audio-volume-muted-symbolic.svg -r $msgID
  fi
else
  dunstify "Volume Muted" -h string:fgcolor:#989719 -i $iconPath/audio-volume-mute.png -r $msgID
fi

