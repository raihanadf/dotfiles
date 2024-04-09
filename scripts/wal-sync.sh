#!/bin/bash

if [ $# -eq 1 ]
then
	# set wallpaper and sync color
	wal -i "$1" && sleep 0.7 && xdotool key alt+F5

	# set display manager wallpaper
	cp $1 /usr/share/sddm/themes/dimana-tema-sddm-aku/background.jpg

	# update betterlockscreen // async
	betterlockscreen -u "$1" --fx dim &
	dunstify "Wallpaper Synced"
else
	wal -R && sleep 0.7 && xdotool key alt+F5
	dunstify "Wallpaper Restored"
fi
