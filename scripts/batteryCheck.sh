#!/bin/sh

while true
do
  # this checks for power is plugged or not
  charging="$(cat /sys/class/power_supply/ADP1/online)"
  if [[ $charging = "0" ]]; then
    # this one checks the capacity of the battery
    battery="$(cat /sys/class/power_supply/BAT1/capacity)"
    if [[ $battery < "20" ]]; then
      # send notification
      dunstify "I NEED TO CHARGEEE!!" "IT IS NOW $battery% MANNN" -h string:fgcolor:#ff4444 -h string:frcolor:#ba0606 
    else
      # idk if we could just go with simple if without no else or not
      echo ''
    fi
  else
    echo ''
  fi
  # checks or run for every 5 minute / 300 seconds
  sleep 300
done
