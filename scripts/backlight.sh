#!/bin/bash

# needed
# - brightnessctl

msgID="92375" # Arbitrary, can be anything
iconPath="/home/raihan/.dotfiles/scripts/cat"

case "$1" in
  "up")
    brightnessctl s +5%
    ;;

  "down")
    brightnessctl s 5%-
    ;;
esac

value="$(brightnessctl -m | awk -F, '{print $4}' | tr -d %)"

if [ "$value" -gt "80" ]; then
  dunstify "Brightness" "Value: [$value%]" -h int:value:"$value" -i $iconPath/brightness_7.png -r $msgID
elif [ "$value" -gt "65" ]; then
  dunstify "Brightness" "Value: [$value%]" -h int:value:"$value" -i $iconPath/brightness_5.png -r $msgID
elif [ "$value" -gt "30" ]; then
  dunstify "Brightness" "Value: [$value%]" -h int:value:"$value" -i $iconPath/brightness_3.png -r $msgID
elif [ "$value" -gt "0" ]; then
  dunstify "Brightness" "Value: [$value%]" -h int:value:"$value" -i $iconPath/brightness_1.png -r $msgID
elif [ "$value" == "0" ]; then
  dunstify "Brightness" "Value: [$value%]" -h int:value:"$value" -i $iconPath/notification-display-brightness-off.svg -r $msgID
fi

