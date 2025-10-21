#!/bin/bash

set -e

# Paths
USER_HOME=$(getent passwd "${SUDO_USER:-$USER}" | cut -d: -f6)
DOTFILES="$USER_HOME/.dotfiles/system/etc"
SYSTEM_MODPROBE="/etc/modprobe.d"
SYSTEM_UDEV="/etc/udev/rules.d"
SYSTEM_X11="/etc/X11"

# File names
PM_RULES="80-nvidia-pm.rules"
XORG_CONF="xorg.conf"
TARGET_CONF="nvidia.conf"

# Mode to source file mapping
declare -A MODE_FILES=(
    ["nvidia"]="nvidia-only.conf"
    ["hybrid"]="nvidia.conf"
)

log() {
    local level=$1
    shift
    case $level in
        info) echo -e "\033[0;32m✓\033[0m $*" ;;
        warn) echo -e "\033[1;33m!\033[0m $*" ;;
        error) echo -e "\033[0;31m✗\033[0m $*" >&2 ;;
    esac
}

notify() {
    local title=$1
    local message=$2
    local urgency=${3:-normal}
    
    # Send notification as the real user, not root
    if [ -n "$SUDO_USER" ]; then
        sudo -u "$SUDO_USER" DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u "$SUDO_USER")/bus \
            notify-send -u "$urgency" "$title" "$message" 2>/dev/null || true
    fi
}

die() {
    log error "$@"
    notify "GPU Mode Switcher" "Error: $*" critical
    exit 1
}

require_root() {
    [ "$EUID" -eq 0 ] || die "Need root access. Try: sudo $0 $*"
}

file_exists() {
    [ -f "$1" ] || die "Missing file: $1"
}

install_file() {
    local src=$1
    local dest=$2
    log info "Installing $(basename "$dest")"
    cp "$src" "$dest"
}

remove_file() {
    local file=$1
    if [ -f "$file" ]; then
        log info "Removing $(basename "$file")"
        rm -f "$file"
    fi
}

rebuild_initramfs() {
    log info "Rebuilding initramfs..."
    if command -v mkinitcpio &> /dev/null; then
        mkinitcpio -P
    elif command -v dracut &> /dev/null; then
        dracut -f
    elif command -v update-initramfs &> /dev/null; then
        update-initramfs -u
    else
        log warn "Could not detect initramfs tool, please rebuild manually"
    fi
}

manage_nvidia_services() {
    local action=$1
    local services=(
        "nvidia-persistenced"
        "nvidia-suspend"
        "nvidia-hibernate"
        "nvidia-resume"
    )
    
    for service in "${services[@]}"; do
        if systemctl list-unit-files | grep -q "$service"; then
            systemctl "$action" "$service" 2>/dev/null || true
            log info "$service: $action"
        fi
    done
}

switch_mode() {
    local mode=$1
    local source_conf="${MODE_FILES[$mode]}"
    local conf_file="$DOTFILES/modprobe.d/$source_conf"
    local udev_rule="$DOTFILES/udev/rules.d/$PM_RULES"
    local xorg_file="$DOTFILES/X11/$XORG_CONF"
    
    require_root "$mode"
    file_exists "$conf_file"
    
    notify "GPU Mode Switcher" "Switching to $mode mode..."
    log info "Switching to $mode mode..."
    
    if [ "$mode" = "nvidia" ]; then
        remove_file "$SYSTEM_UDEV/$PM_RULES"
        file_exists "$xorg_file"
        install_file "$xorg_file" "$SYSTEM_X11/$XORG_CONF"
        $HOME/.dotfiles/scripts/kwin-gpu-switcher.sh nvidia --no-logout
    else
        file_exists "$udev_rule"
        install_file "$udev_rule" "$SYSTEM_UDEV/$PM_RULES"
        remove_file "$SYSTEM_X11/$XORG_CONF"
        $HOME/.dotfiles/scripts/kwin-gpu-switcher.sh intel --no-logout
    fi
    
    install_file "$conf_file" "$SYSTEM_MODPROBE/$TARGET_CONF"
    
    manage_nvidia_services "enable"
    rebuild_initramfs
    
    log info "Done! Reboot to apply changes."
    notify "GPU Mode Switcher" "Switched to $mode mode. Please reboot." normal

    if command -v rofi &>/dev/null; then
        choice=$(echo -e "Yes\nNo" | rofi -dmenu -p "Reboot now?" -theme-str 'window {width: 200px;}')
        if [ "$choice" = "Yes" ]; then
            log info "Rebooting..."
            notify "GPU Mode Switcher" "Rebooting now..." normal
            systemctl reboot
        else
            log info "Reboot skipped."
            notify "GPU Mode Switcher" "Reboot skipped." low
        fi
    else
        log warn "Rofi not found, skipping confirmation prompt."
    fi
}

show_status() {
    log info "Current configuration:"
    echo
    
    if [ -f "$SYSTEM_MODPROBE/$TARGET_CONF" ]; then
        echo "Modprobe config:"
        head -5 "$SYSTEM_MODPROBE/$TARGET_CONF" | sed 's/^/  /'
    else
        log warn "No nvidia.conf found"
    fi
    
    echo
    
    if [ -f "$SYSTEM_UDEV/$PM_RULES" ]; then
        log info "Power management: enabled (hybrid mode)"
    else
        log info "Power management: disabled (nvidia mode)"
    fi
    
    if [ -f "$SYSTEM_X11/$XORG_CONF" ]; then
        log info "X11 config: present (nvidia mode)"
    else
        log info "X11 config: not present (hybrid mode)"
    fi
}

show_help() {
    cat << EOF
NVIDIA Mode Switcher

Usage: $0 [command]

Commands:
    nvidia     Discrete GPU only
    hybrid     Optimus with power management
    status     Show current setup
    help       Show this message

Examples:
    sudo $0 nvidia
    sudo $0 hybrid
    $0 status
EOF
}

case "${1:-}" in
    nvidia|hybrid) switch_mode "$1" ;;
    status) show_status ;;
    help|--help|-h|"") show_help ;;
    *) die "Unknown command: $1" ;;
esac
