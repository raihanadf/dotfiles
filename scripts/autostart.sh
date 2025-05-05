#!/bin/bash

redshift -P -O 4600K

dunst & 
dunstify "Welcome!"

# colours
black=#000000
pink=#ffc2d0
peach=#fad5d5
red=#f92672
green=#a6e22e
yellow=#e6db74
orange=#ffe1b1
blue=#3C50FF
purple=#ae81ff
white=#faedff

# variables
blink=0

cpu() {
	printf "^c$white^ 󰝨 ^c$white^$(cat /sys/class/thermal/thermal_zone3/temp | cut -c1-2)°"
}

wifi() {
	color=$green
  LOCAL_IP="$(ip -o -4 addr list wlan0 | awk '{print $4}' | cut -d/ -f1)"
  if [ ! -z "$LOCAL_IP" -a "$LOCAL_IP" != " " ]; then
    printf "^c$color^󰧟 ^c$white^"
  fi
}

dnd() {
  # im using dunst btw
  if [ "$(dunstctl is-paused)" = "true" ]; then
      printf "^c$yellow^󰽧 "
  fi
}

battery() {
  charging="$(cat /sys/class/power_supply/ADP1/online)"
  battery=$(cat /sys/class/power_supply/BAT1/capacity)

  if [[ $charging = "1" ]]; then
    if [[ $blink = "1" ]]; then
      printf "^c$red^󱢠 ^c$white^$battery󱉸"  # Show icon when blink=1
    else
      printf "^c$red^󰣐 ^c$white^$battery󱉸"  # Hide icon when blink=1
    fi
  else
    if [[ $battery -gt 15 ]]; then
      printf "^c$blue^󱢠 ^c$white^$battery󱉸"
    else
      printf "^c$red^󱢠 $battery󱉸"
    fi
  fi

}

clock() {
	printf "^c$white^$(date '+%I:%M %p') "
}

pomo() {
  if pgrep -x "potd" > /dev/null;
  then
    printf " $(potctl | awk 'NR==2 {print $3}') "
  fi
}

adb() {
  if pgrep -x "adb" >/dev/null;
  then
		printf "󰀲 "
  fi
}

bluetooth() {
  mouse="$(upower -i $(upower -e | grep -E 'mouse|pointer' | head -n 1) | awk -F': ' '/percentage:/ {print $2}' | tr -d '%' | grep -o '[0-9]*' | sed '/^$/d')"
  if [ -n "$mouse" ]; then
    printf "󰂯[$mouse] "
  fi
}

reload_color() {
    white=$(xrdb -query | grep color7 | sed 's/.*\t//' | head -n 1)
    if [ -z "$white" ]; then
				# if color7 doesn't exist
        white="#ffffff"  
    fi
}

while true; do
	reload_color
	sleep 1 && xsetroot -name "$(wifi)$(dnd)$(clock)$(bluetooth)$(battery)"
	blink=$((1 - blink)) 
done
