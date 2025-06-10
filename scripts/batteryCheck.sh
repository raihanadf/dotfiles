#!/bin/sh

iconPath="$HOME/.dotfiles/scripts/cat"

perform_low_battery_action() {
    dunstify "BROOOOO" "AMBATUSHUTDOWN" -i $iconPath/cat_angry.jpg
    sleep 5
    for i in {5..1}; do
        dunstify "Shutdown in $i..."
        sleep 3
    done
    perform_next_action
}

perform_next_action() {
  charging="$(cat /sys/class/power_supply/ADP1/online)"
  if [[ $charging = "0" ]]; then
    dunstctl close-all
    dunstify "FUCK YOU" "IM SHUTTING DOWN" -i $iconPath/cat_middle_finger.png
    sleep 2
    shutdown -h now
  else
    dunstctl close-all
    dunstify "sip" "awas u gitu lagi..." -i $iconPath/cat_thumbs_up.png
  fi
}

while true
do
  # this checks for power is plugged or not
  charging="$(cat /sys/class/power_supply/ADP1/online)"
  if [[ $charging = "0" ]]; then
    # this one checks the capacity of the battery
    battery="$(cat /sys/class/power_supply/BAT1/capacity)"
    if [[ $battery -ge "10" && $battery -le "15" ]]; then
        dunstify "I NEED TO CHARGEEE!!" "IT IS NOW $battery% MANNN" -h string:fgcolor:#ff4444 -h string:frcolor:#ba0606 
    elif [[ $battery -le "8" ]]; then
        perform_low_battery_action
    fi
  else
    echo "You're still charging"
  fi
  # checks or run for every 5 minute / 300 seconds
  sleep 300
done
