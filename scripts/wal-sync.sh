#!/bin/bash

refresh_dwm () {
	sleep 1.2 && xdotool key super+F5
}

if [ $# -eq 1 ]
then
	# set wallpaper and sync color
	wal -i "$1" -s -t --saturate 0.2 -n
	nitrogen --set-zoom-fill "$1" --save

	# set display manager wallpaper
	cp "$1" /usr/share/sddm/themes/dimana-tema-sddm-aku/background.jpg

	# update betterlockscreen // async
	# betterlockscreen -u "$1" --fx dim &
	refresh_dwm
	dunstify "Wallpaper Synced"
else
	nitrogen --restore
	wal -R -s -t --saturate 0.2 -n
	refresh_dwm
	dunstify "Wallpaper Restored"
fi
