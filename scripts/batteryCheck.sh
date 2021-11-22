#!/bin/sh

while true
do
  # this checks for power is plugged or not
  charging="$(cat /sys/class/power_supply/ADP1/online)"
  if [[ $charging = "0" ]]; then
    # this one checks the capacity of the battery
    battery="$(cat /sys/class/power_supply/BAT1/capacity)"
    if [[ $battery < "30" ]]; then
      # send notification
      dunstify "ur battery is low, bitch" "it is now $battery%" -h string:fgcolor:#ff4444
    else
      # idk if we could just go with simple if without no else or not
      echo ''
    fi
  else
    echo ''
  fi
  # checks or run for every 1 minute / 60 seconds
  sleep 60
done
