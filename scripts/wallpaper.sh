#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

pick_wallpaper() {
    # List filenames only for display, but store full paths
    declare -A files
    while IFS= read -r path; do
        name=$(basename "$path")
        files["$name"]="$path"
    done < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) | sort)

    selected=$(printf '%s\n' "${!files[@]}" | sort | fuzzel --dmenu --prompt " Wallpaper: ")
    [ -n "$selected" ] && echo "${files[$selected]}"
}

set_wallpaper() {
    swww img "$1" --transition-type grow --transition-pos center --transition-duration 1
}

case "${1:-}" in
    --pick)
        wallpaper=$(pick_wallpaper)
        ;;
    --random)
        wallpaper=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) | shuf -n 1)
        ;;
    "")
        wallpaper=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \) | shuf -n 1)
        ;;
    *)
        wallpaper="$1"
        ;;
esac

[ -n "$wallpaper" ] && set_wallpaper "$wallpaper"
