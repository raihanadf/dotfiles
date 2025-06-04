#!/bin/bash

# Configuration
NOTIF_ID=9999
STATE_FILE="$HOME/.touchpad_state"
DEVICE="$(xinput list | grep -P '(?<= )[\w\s:]*Touchpad(?!.*Synaptics)(?i)(?-i).*?(?=\s*id)' -o | head -n1)"

# Functions
get_current_state() {
    xinput list-props "$DEVICE" | grep -P ".*Device Enabled.*\K.(?=$)" -o
}

save_state() {
    echo "$1" > "$STATE_FILE"
}

load_state() {
    if [ ! -f "$STATE_FILE" ]; then
        # If no state file exists, create one with current state
        current_state=$(get_current_state)
        save_state "$current_state"
    fi

    saved_state=$(cat "$STATE_FILE")
    
    # Small delay to ensure touchpad is available
    sleep 0.5
    
    if [ "$saved_state" = "0" ]; then
        xinput disable "$DEVICE"
    else
        xinput enable "$DEVICE"
    fi
}

toggle_state() {
    current_state=$(get_current_state)
    
    if [ "$current_state" = "1" ]; then
        xinput disable "$DEVICE"
        new_state=0
        notify-send -a "Touchpad" -r "$NOTIF_ID" "Touchpad: Disabled" "The touchpad has been disabled"
    else
        xinput enable "$DEVICE"
        new_state=1
        notify-send -a "Touchpad" -r "$NOTIF_ID" "Touchpad: Enabled" "The touchpad has been enabled"
    fi
    
    save_state "$new_state"
}

# Main execution
case "$1" in
    -l|--load)
        load_state
        ;;
    *)
        toggle_state
        ;;
esac
