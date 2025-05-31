#!/bin/bash

SATURATION=0.2

refresh_dwm () {
	sleep 1.2 && xdotool key super+F5
}

if [ $# -ge 1 ]
then
	WALLPAPER="$*"

	wal -i "$WALLPAPER" -s -t --saturate $SATURATION -n
	nitrogen --set-zoom-fill "$WALLPAPER" --save

	cp "$WALLPAPER" /usr/share/sddm/themes/dimana-tema-sddm-aku/background.jpg

	# update betterlockscreen // async
	# betterlockscreen -u "$WALLPAPER" --fx dim

	refresh_dwm
	dunstify "Wallpaper Synced"
else
	nitrogen --restore
	wal -R -s -t --saturate $SATURATION -n
	refresh_dwm
	dunstify "Wallpaper Restored"
fi
