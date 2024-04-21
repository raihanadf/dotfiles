#!/bin/bash

if [ $# -eq 1 ]
then
	# set wallpaper and sync color
	wal -i "$1" -s -t

	# set display manager wallpaper
	cp $1 /usr/share/sddm/themes/dimana-tema-sddm-aku/background.jpg

	# update betterlockscreen // async
	# betterlockscreen -u "$1" --fx dim &
	dunstify "Wallpaper Synced"
else
	wal -R -s -t
	dunstify "Wallpaper Restored"
fi

sleep 1.2 && xdotool key super+F5
