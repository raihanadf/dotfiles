#!/bin/bash

# Dependencies
# - brightnessctl
# - ePapirus (icon)

msgID="92375" # Arbitrary, can be anything
iconPath="/usr/share/icons/ePapirus/48x48/status"

case "$1" in
  "up")
    brightnessctl s +5%
    ;;

  "down")
    brightnessctl s 5%-
    ;;
esac

value="$(brightnessctl -m | awk -F, '{print $4}' | tr -d %)"

if [ "$value" -gt "90" ]; then
  dunstify "Brightness $value%" -h int:value:"$value" -i $iconPath/notification-display-brightness-full.svg -r $msgID
elif [ "$value" -gt "65" ]; then
  dunstify "Brightness $value%" -h int:value:"$value" -i $iconPath/notification-display-brightness-high.svg -r $msgID
elif [ "$value" -gt "30" ]; then
  dunstify "Brightness $value%" -h int:value:"$value" -i $iconPath/notification-display-brightness-medium.svg -r $msgID
elif [ "$value" -gt "0" ]; then
  dunstify "Brightness $value%" -h int:value:"$value" -i $iconPath/notification-display-brightness-low.svg -r $msgID
elif [ "$value" == "0" ]; then
  dunstify "Brightness $value%" -h int:value:"$value" -i $iconPath/notification-display-brightness-off.svg -r $msgID
fi


