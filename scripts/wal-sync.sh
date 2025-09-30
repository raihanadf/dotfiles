#!/bin/bash

SATURATION=0.2

refresh_dwm() {
    sleep 1.2 && xdotool key super+F5
}

apply_wallpaper() {
    WALL="$1"
    MON_COUNT=$(xrandr --listmonitors | grep -c '^[ ]*[0-9]')
    for i in $(seq 0 $((MON_COUNT-1))); do
        nitrogen --head=$i --set-zoom-fill "$WALL" --save
    done
}

get_sddm_theme() {
    awk -F= '/^\[Theme\]/{f=1;next}/^\[/{f=0} f && tolower($1)~/^current/{gsub(/^[ \t]+|[ \t]+$/,"",$2);print $2;exit}' \
        /etc/sddm.conf /etc/sddm.conf.d/* 2>/dev/null
}

if [ $# -ge 1 ]; then
    WALL="$*"
    wal -i "$WALL" -s -t --saturate $SATURATION -n
    apply_wallpaper "$WALL"

    THEME=$(get_sddm_theme)
    THEME_PATH="/usr/share/sddm/themes/$THEME"
    cp "$WALL" "$THEME_PATH/background.jpg"
    sed -i '/^background=/c\background=background.jpg' "$THEME_PATH/theme.conf.user" 2>/dev/null || \
    echo -e "[General]\nbackground=background.jpg" > "$THEME_PATH/theme.conf.user"

    refresh_dwm
    dunstify "Wallpaper Synced ($THEME)"
else
    nitrogen --restore
    wal -R -s -t --saturate $SATURATION -n
    refresh_dwm
    dunstify "Wallpaper Restored"
fi
