#!/bin/bash

SATURATION=0.2

refresh_dwm () {
	sleep 1.2 && xdotool key super+F5
}

apply_wallpaper () {
    WALL="$1"
    MON_COUNT=$(xrandr --listmonitors | grep -c '^[ ]*[0-9]')

    for i in $(seq 0 $((MON_COUNT-1))); do
        nitrogen --head=$i --set-zoom-fill "$WALL" --save
    done
}

if [ $# -ge 1 ]
then
	WALLPAPER="$*"

	wal -i "$WALLPAPER" -s -t --saturate $SATURATION -n
	apply_wallpaper "$WALLPAPER"

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
