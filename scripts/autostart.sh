#!/bin/bash

dunstify "Welcome!"
redshift -P -O 5500K

# discord
if pgrep -x "Discord" >/dev/null
then
    dunstify "Discord is running"
else
    dunstify "Starting Discord"
    discord --start-minimized
fi

# colours
black=#05080a
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

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata title)"
fi

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
printf "^b$blue^^c$black^ 󱩅 ^b$black^"
# printf "^c$blue^󱩅 $(playerctl metadata --format '{{ uc(title) }}' | cut -c1-20 | sed 's/%//') "
elif [[ $player_status = "Paused" ]]; then
printf "^b$red^^c$black^ 󱩅 ^b$black^"
else
    echo "^b$yellow^^c$black^ 󱩅 ^b$black^"
fi
} 
# mem() {
# 	printf "^c$yellow^󰍛 $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
# }

cpu() {
	printf "^c$white^^b$black^ 󰝨 ^c$white^^b$black^$(cat /sys/class/thermal/thermal_zone3/temp | cut -c1-2)°"
}

wifi() {
	
LOCAL_IP="$(ip -o -4 addr list wlo1 | awk '{print $4}' | cut -d/ -f1)"
if [ ! -z "$LOCAL_IP" -a "$LOCAL_IP" != " " ]; then
	printf "^c$green^^b$black^󰣏^c$white^^b$black^ $LOCAL_IP"
	else
	printf "^c$white^^b$black^󱀝^c$white^^b$black^ NOT CONNECTED"
fi
}

battery() {
charging="$(cat /sys/class/power_supply/ADP1/online)"
battery=$(cat /sys/class/power_supply/BAT1/capacity)
if [[ $charging = "0" ]]; then

	# with icons
	# if [[ $battery > "90" ]]; then
	# 	printf "^c$white^^b$black^󰁹 ^c$white^^b$black^$battery󱉸"
	# elif [[ $battery > "65" ]]; then
	# 	printf "^c$white^^b$black^󰂁 ^c$white^^b$black^$battery󱉸"
	# elif [[ $battery > "40" ]]; then
	# 	printf "^c$white^^b$black^󰁿 ^c$white^^b$black^$battery󱉸"
	# elif [[ $battery > "30" ]]; then
	# 	printf "^c$white^^b$black^󰁻 ^c$white^^b$black^$battery󱉸"
	# elif [[ $battery > "17" ]]; then
	# 	printf "^c$white^^b$black^󰁺 ^c$white^^b$black^$battery󱉸"
	# elif [[ $battery > "13" ]]; then
	# 	printf "^c$white^^b$black^󱃍 ^c$white^^b$black^$battery󱉸"
	# else
	# 	printf "^c$white^^b$black^󱃍 ^c$white^^b$black^$battery󱉸"
	# 	dunstify "I NEED TO CHARGEEEEE!!!" "IT IS NOW $battery%" -h string:fgcolor:#ff4444 -h string:frcolor:#ba0606 
	# fi
	#  else
	# 	printf "^c$white^^b$black^󰂄 ^c$white^^b$black^$battery󱉸"

	# without icons
	if [[ $battery > "15" ]]; then
		printf "^b$blue^^c$black^ 󱀝 ^c$blue^^b#252525^  $battery󱉸 "
	else
		printf "^b$red^^c$black^ 󱀝 ^c$red^^b#252525^  $battery󱉸 "
	fi
	 else
		printf "^b$blue^^c$black^ 󱢠 ^c$blue^^b#252525^  $battery󱉸 "

  fi
}

clock() {
	# printf "^c$white^^b$black^󰃰 ^c$white^^b$black^ $(date '+%a %I:%M %p')"
	printf "^c$white^^b$black^$(date '+%I:%M %p')"
}

while true; do
	sleep 1 && xsetroot -name "$(clock)  $(battery)"
done
