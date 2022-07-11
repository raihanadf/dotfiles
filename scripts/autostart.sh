#!/bin/bash

dunstify "Welcome!"
xset s 900 && xss-lock --transfer-sleep-lock -- slock

# colours
black=#05080a
pink=#ffc2d0
peach=#fad5d5
red=#ffb7b2
green=#b9fdcd
yellow=#ffffc6
orange=#ffe1b1
blue=#C4FFFE
purple=#d7caed
white=#faedff

spotify() {

PS=$(2>/dev/null playerctl status)
NP='No players found'

  if [[ "$PS" == *"$NP"* ]]; then
    printf " "
  else
	printf "^c$blue^󰎇 $(playerctl metadata --format '{{ uc(artist) }}' | cut -c1-20 | sed 's/%//') "
	printf "^c$red^$(playerctl metadata --format '{{ uc(title) }}' | cut -c1-20 | sed 's/%//')"
  fi
} 
# mem() {
# 	printf "^c$yellow^󰍛 $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
# }

cpu() {
	printf "^c$orange^^b$black^󰝨 $(cat /sys/class/thermal/thermal_zone3/temp | cut -c1-2)°"
}

battery() {
charging="$(cat /sys/class/power_supply/ADP1/online)"
battery=$(cat /sys/class/power_supply/BAT1/capacity)
if [[ $charging = "0" ]]; then
	if [[ $battery > "90" ]]; then
		printf "^c$green^󰁹 $battery"
	elif [[ $battery > "65" ]]; then
		printf "^c$green^󰂁 $battery"
	elif [[ $battery > "40" ]]; then
		printf "^c$green^󰁿 $battery"
	elif [[ $battery > "30" ]]; then
		printf "^c$green^󰁻 $battery"
	elif [[ $battery > "17" ]]; then
		printf "^c$green^󰁺 $battery"
	elif [[ $battery > "13" ]]; then
		printf "^c$green^󱃍 $battery"
	else
		printf "^c$green^󱃍 $battery"
		dunstify "I NEED TO CHARGEEEEE!!!" "IT IS NOW $battery%" -h string:fgcolor:#ff4444 -h string:frcolor:#ba0606 
	fi
	 else
		printf "^c$green^くコ:彡 [$battery]"
  fi
}

clock() {
	printf "^c$white^󰅐 $(date '+%I:%M %p')"
}

while true; do
  sleep 1 && xsetroot -name "$(spotify) $(cpu) $(battery) $(clock)"
done
