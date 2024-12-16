#!/bin/bash

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

active_screenshot() {
    for i in {3..1}; do
        dunstify -r 9999 "Screenshot" "Taking shot in $i seconds..."
        sleep 1
    done

    FILENAME="$SCREENSHOT_DIR/active_$(date +%Y%m%d_%H%M%S).png"
    scrot -u "$FILENAME" && dunstify "Screenshot" "Screenshot saved to $FILENAME"
}

full_screenshot() {
    for i in {3..1}; do
        dunstify -r 9999 "Screenshot" "Taking full screenshot in $i seconds..."
        sleep 1
    done

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
