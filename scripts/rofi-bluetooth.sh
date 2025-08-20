#!/bin/bash

divider="---------"
goback="Back"

# Rofi command to pipe into, can add any options here
rofi_command="rofi -dmenu $* -p"
# Larger input command for renaming
rofi_input_command="rofi -dmenu -lines 1 -width 50 -p"

# Checks if bluetooth controller is powered on
power_on() {
    if bluetoothctl show | grep -q "Powered: yes"; then
        return 0
    else
        return 1
    fi
}

# Toggles power state
toggle_power() {
    if power_on; then
        bluetoothctl power off
        show_menu
    else
        if rfkill list bluetooth | grep -q 'blocked: yes'; then
            rfkill unblock bluetooth && sleep 3
        fi
        bluetoothctl power on
        show_menu
    fi
}

# Checks if controller is scanning for new devices
scan_on() {
    if bluetoothctl show | grep -q "Discovering: yes"; then
        echo "Scan: on"
        return 0
    else
        echo "Scan: off"
        return 1
    fi
}

# Toggles scanning state
toggle_scan() {
    if scan_on; then
        kill $(pgrep -f "bluetoothctl scan on")
        bluetoothctl scan off
        show_menu
    else
        bluetoothctl scan on &
        echo "Scanning..."
        sleep 5
        show_menu
    fi
}

# Checks if controller is able to pair to devices
pairable_on() {
    if bluetoothctl show | grep -q "Pairable: yes"; then
        echo "Pairable: on"
        return 0
    else
        echo "Pairable: off"
        return 1
    fi
}

# Toggles pairable state
toggle_pairable() {
    if pairable_on; then
        bluetoothctl pairable off
        show_menu
    else
        bluetoothctl pairable on
        show_menu
    fi
}

# Checks if controller is discoverable by other devices
discoverable_on() {
    if bluetoothctl show | grep -q "Discoverable: yes"; then
        echo "Discoverable: on"
        return 0
    else
        echo "Discoverable: off"
        return 1
    fi
}

# Toggles discoverable state
toggle_discoverable() {
    if discoverable_on; then
        bluetoothctl discoverable off
        show_menu
    else
        bluetoothctl discoverable on
        show_menu
    fi
}

# Checks if a device is connected
device_connected() {
    device_info=$(bluetoothctl info "$1")
    if echo "$device_info" | grep -q "Connected: yes"; then
        return 0
    else
        return 1
    fi
}

# Toggles device connection
toggle_connection() {
    if device_connected "$1"; then
        bluetoothctl disconnect "$1"
        device_menu "$device"
    else
        bluetoothctl connect "$1"
        device_menu "$device"
    fi
}

# Checks if a device is paired
device_paired() {
    device_info=$(bluetoothctl info "$1")
    if echo "$device_info" | grep -q "Paired: yes"; then
        echo "Paired: yes"
        return 0
    else
        echo "Paired: no"
        return 1
    fi
}

# Toggles device paired state
toggle_paired() {
    if device_paired "$1"; then
        bluetoothctl remove "$1"
        device_menu "$device"
    else
        bluetoothctl pair "$1"
        device_menu "$device"
    fi
}

# Checks if a device is trusted
device_trusted() {
    device_info=$(bluetoothctl info "$1")
    if echo "$device_info" | grep -q "Trusted: yes"; then
        echo "Trusted: yes"
        return 0
    else
        echo "Trusted: no"
        return 1
    fi
}

# Toggles device connection
toggle_trust() {
    if device_trusted "$1"; then
        bluetoothctl untrust "$1"
        device_menu "$device"
    else
        bluetoothctl trust "$1"
        device_menu "$device"
    fi
}

# Function to get Bluetooth devices with MAC addresses using bt-device
get_bt_devices() {
    bt-device -l | grep -E '^.* \(.*\)$' | while read -r line; do
        # Extract device name (remove MAC part in parentheses)
        device_name=$(echo "$line" | sed 's/ (.*)//')
        # Extract MAC address
        mac=$(echo "$line" | grep -oE '([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}')
        echo -e "$device_name\t$mac"
    done
}

# Function to rename a device
rename_device() {
    local mac="$1"
    local current_name="$2"
    
    # Show input dialog for new name with larger size
    new_name=$(echo "" | $rofi_input_command "New name for '$current_name':")
    
    if [ -n "$new_name" ]; then
        # Execute the rename command
        result=$(bt-device --set "$mac" Alias "$new_name" 2>&1)
        
        # Show result notification
        if echo "$result" | grep -q "Alias:"; then
            notify-send "Bluetooth Rename" "Successfully renamed '$current_name' to '$new_name'"
        else
            notify-send "Bluetooth Rename" "Error: $result" -u critical
        fi
    fi
}

# Function to show rename device menu
show_rename_menu() {
    # Get list of devices using bt-device
    devices=$(get_bt_devices)
    
    if [ -z "$devices" ]; then
        notify-send "Bluetooth Rename" "No Bluetooth devices found" -u critical
        show_menu
        return
    fi
    
    # Show device selection menu
    selected=$(echo -e "$devices" | $rofi_command "Select device to rename")
    
    if [ -n "$selected" ]; then
        # Extract device name and MAC from selection
        device_name=$(echo "$selected" | cut -f1)
        mac=$(echo "$selected" | cut -f2)
        
        # Call rename function
        rename_device "$mac" "$device_name"
    fi
    
    show_menu
}

# Prints a short string with the current bluetooth status
# Useful for status bars like polybar, etc.
print_status() {
    if power_on; then
        printf ''

        paired_devices_cmd="devices Paired"
        # Check if an outdated version of bluetoothctl is used to preserve backwards compatibility
        if (( $(echo "$(bluetoothctl version | cut -d ' ' -f 2) < 5.65" | bc -l) )); then
            paired_devices_cmd="paired-devices"
        fi

        mapfile -t paired_devices < <(bluetoothctl $paired_devices_cmd | grep Device | cut -d ' ' -f 2)
        counter=0

        for device in "${paired_devices[@]}"; do
            if device_connected "$device"; then
                device_alias=$(bluetoothctl info "$device" | grep "Alias" | cut -d ' ' -f 2-)

                if [ $counter -gt 0 ]; then
                    printf ", %s" "$device_alias"
                else
                    printf " %s" "$device_alias"
                fi

                ((counter++))
            fi
        done
        printf "\n"
    else
        echo ""
    fi
}

# A submenu for a specific device that allows connecting, pairing, and trusting
device_menu() {
    device=$1

    # Get device name and mac address
    device_name=$(echo "$device" | cut -d ' ' -f 3-)
    mac=$(echo "$device" | cut -d ' ' -f 2)

    # Build options
    if device_connected "$mac"; then
        connected="Connected: yes"
    else
        connected="Connected: no"
    fi
    paired=$(device_paired "$mac")
    trusted=$(device_trusted "$mac")
    options="$connected\n$paired\n$trusted\nRename Device\n$divider\n$goback\nExit"

    # Open rofi menu, read chosen option
    chosen="$(echo -e "$options" | $rofi_command "$device_name")"

    # Match chosen option to command
    case "$chosen" in
        "" | "$divider")
            echo "No option chosen."
            ;;
        "$connected")
            toggle_connection "$mac"
            ;;
        "$paired")
            toggle_paired "$mac"
            ;;
        "$trusted")
            toggle_trust "$mac"
            ;;
        "Rename Device")
            rename_device "$mac" "$device_name"
            device_menu "$device"
            ;;
        "$goback")
            show_menu
            ;;
    esac
}

# Opens a rofi menu with current bluetooth status and options to connect
show_menu() {
    # Get menu options
    if power_on; then
        power="Power: on"

        # Human-readable names of devices, one per line
        # If scan is off, will only list paired devices
        devices=$(bluetoothctl devices | grep Device | cut -d ' ' -f 3-)

        # Get controller flags
        scan=$(scan_on)
        pairable=$(pairable_on)
        discoverable=$(discoverable_on)

        # Options passed to rofi
        options="$devices\n$divider\n$power\n$scan\n$pairable\n$discoverable\nRename Device\nExit"
    else
        power="Power: off"
        options="$power\nExit"
    fi

    # Open rofi menu, read chosen option
    chosen="$(echo -e "$options" | $rofi_command "Bluetooth")"

    # Match chosen option to command
    case "$chosen" in
        "" | "$divider")
            echo "No option chosen."
            ;;
        "$power")
            toggle_power
            ;;
        "$scan")
            toggle_scan
            ;;
        "$discoverable")
            toggle_discoverable
            ;;
        "$pairable")
            toggle_pairable
            ;;
        "Rename Device")
            show_rename_menu
            ;;
        *)
            device=$(bluetoothctl devices | grep "$chosen")
            # Open a submenu if a device is selected
            if [[ $device ]]; then device_menu "$device"; fi
            ;;
    esac
}

case "$1" in
    --status)
        print_status
        ;;
    *)
        show_menu
        ;;
esac
