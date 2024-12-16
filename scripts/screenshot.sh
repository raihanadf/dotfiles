#!/bin/bash
SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

countdown_notify() {
    local message="$1"
    for i in {3..1}; do
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
    FILENAME="$SCREENSHOT_DIR/active_$(date +%Y%m%d_%H%M%S).png"
    scrot -u "$FILENAME" && dunstify "Screenshot" "Screenshot saved to $FILENAME"
}

full_screenshot() {
    countdown_notify "Taking full screenshot"
    FILENAME="$SCREENSHOT_DIR/full_$(date +%Y%m%d_%H%M%S).png"
    scrot "$FILENAME" && dunstify "Screenshot" "Screenshot saved to $FILENAME"
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
