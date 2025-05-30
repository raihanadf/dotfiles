#!/bin/bash

SATURATION=0.2

refresh_dwm () {
	sleep 1.2 && xdotool key super+F5
}

if [ $# -eq 1 ]
then
	# set wallpaper and sync color
	wal -i "$1" -s -t --saturate $SATURATION -n
	nitrogen --set-zoom-fill "$1" --save

	# set display manager wallpaper
	cp "$1" /usr/share/sddm/themes/dimana-tema-sddm-aku/background.jpg

	# update betterlockscreen // async
	# betterlockscreen -u "$1" --fx dim
	refresh_dwm
	dunstify "Wallpaper Synced"
else
	nitrogen --restore
	wal -R -s -t --saturate $SATURATION -n
	refresh_dwm
	dunstify "Wallpaper Restored"
fi
