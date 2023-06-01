#!/bin/bash

# auto start apps

### discord
# if ! pgrep -x "Discord" >/dev/null;
# then
#     dunstify "Starting Discord..."
#     discord --start-minimized &
# fi

### steam
# if ! pgrep -x "steam" >/dev/null;
# then
#     dunstify "Starting Steam..."
#     steam -silent &
# fi

redshift -P -O 5500K

# send initial notifications
dunstify "Welcome!"

# colours
black=#1a1a1a
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

# mem() {
# 	printf "^c$yellow^󰍛 $(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
# }

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
		printf "^c$blue^󱀝 ^c$white^ $battery󱉸"
		# printf "^c$red^ 󱢠  ^c$black^ $battery󱉸 "
	else
    printf "^c$red^󱀝 ^c$white^ $battery󱉸"
	fi
	 else
		# printf "^b$blue^^c$black^ 󰣏 ^c$blue^^b#252525^  $battery󱉸 "
		printf "^c$red^󱢠 ^c$white^ $battery󱉸"
  fi
}

clock() {
	# printf "^c$white^^b$black^󰃰 ^c$white^^b$black^ $(date '+%a %I:%M %p')"
	printf "^c$white^^b$black^$(date '+%A %I:%M %p')"
}

pomo() {
  if pgrep -x "spt" >/dev/null;
  then
		printf " ^c$black^^b$red^ 󰔟 ^c$red^^b#252525^  POMO  ^b$black^"
  fi
}


adb() {
  if pgrep -x "adb" >/dev/null;
  then
		printf " ^c$white^ 󰀲 ^b$black^ "
  fi
}

# separator if needed
# s(){
#   printf " ^b$black^ "
# }

while true; do
  sleep 1 && xsetroot -name "$(adb) $(wifi) $(clock) $(pomo) $(battery)"
done
