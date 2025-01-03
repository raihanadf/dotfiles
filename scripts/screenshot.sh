#!/bin/bash
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

countdown_notify() {
    local message="$1"
    for i in {2..1}; do
        dunstify -r 9999 "Screenshot" "$message in $i seconds..."
        sleep 1
        if [ $i -eq 1 ]; then
            dunstify -C 9999
            sleep 0.2
        fi
    done
}

active_screenshot() {
    countdown_notify "Taking shot"
    scrot -u - | xclip -selection clipboard -t image/png && dunstify "Screenshot" "Screenshot copied to clipboard"
}

full_screenshot() {
    countdown_notify "Taking full screenshot"
    scrot - | xclip -selection clipboard -t image/png && dunstify "Screenshot" "Screenshot copied to clipboard"
}

while [[ $# -gt 0 ]]; do
    case $1 in
        --active)
            active_screenshot
            shift
            ;;
        --full)
            full_screenshot
            shift
            ;;
        *)
            echo "Usage: $0 [--active | --region | --full]"
            exit 1
            ;;
    esac
done
