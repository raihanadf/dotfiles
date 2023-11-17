#!/bin/bash

redshift -P -O 4500K

dunst & 
dunstify "Welcome!"

# colours
black=#161616
pink=#ffc2d0
peach=#fad5d5
red=#f92672
green=#a6e22e
yellow=#e6db74
orange=#ffe1b1
blue=#3C50FF
purple=#ae81ff
white=#faedff

music() {
  printf "$($HOME/.dotfiles/scripts/spotify.py)" 
} 

cpu() {
	printf "^c$white^^b$black^ 󰝨 ^c$white^^b$black^$(cat /sys/class/thermal/thermal_zone3/temp | cut -c1-2)°"
}

wifi() {
  LOCAL_IP="$(ip -o -4 addr list wlo1 | awk '{print $4}' | cut -d/ -f1)"
  if [ ! -z "$LOCAL_IP" -a "$LOCAL_IP" != " " ]; then
    printf "^c$white^^b$black^󰽢^c$white^^b$black^ "
    else
    printf "^c$white^^b$black^󰄰^c$white^^b$black^ "
  fi
}

battery() {
  charging="$(cat /sys/class/power_supply/ADP1/online)"
  battery=$(cat /sys/class/power_supply/BAT1/capacity)
  if [[ $charging = "0" ]]; then

	if [[ $battery > "15" ]]; then
		printf "^c$blue^󱀝^c$white^ $battery󱉸"
	else
    printf "^c$red^󱀝^c$white^ $battery󱉸"
	fi
	 else
		printf "^c$red^󱢠^c$white^ $battery󱉸"
  fi
}

clock() {
	printf "^c$white^^b$black^$(date '+%A %I:%M %p') "
}

pomo() {
  if pgrep -x "spt" >/dev/null;
  then
		printf " ^c$white^  ^b$black^ "
  fi
}

adb() {
  if pgrep -x "adb" >/dev/null;
  then
		printf " ^c$white^󰀲^b$black^ "
  fi
}

bluetooth() {
  mouse="$(upower -i $(upower -e | grep -E 'mouse|pointer' | head -n 1) | awk -F': ' '/percentage:/ {print $2}' | tr -d '%' | grep -o '[0-9]*' | sed '/^$/d')"
  if [ -n "$mouse" ]; then
    printf "[$mouse] "
  fi
}

while true; do
  sleep 1 && xsetroot -name "$(bluetooth)$(adb)$(wifi)$(clock)$(pomo)$(battery)"
done
