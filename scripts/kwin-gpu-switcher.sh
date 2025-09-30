#!/usr/bin/env bash
# kwin-gpu-switcher.sh - toggle Intel <-> NVIDIA for KWin/Plasma Wayland
set -e

ENV_FILE="/etc/environment"
INTEL="/dev/dri/by-path/pci-0000\:00\:02.0-card"
NVIDIA="/dev/dri/by-path/pci-0000\:01\:00.0-card"

if [[ ! -f "$ENV_FILE" ]]; then
    echo "Error: $ENV_FILE not found"
    exit 1
fi

CURRENT=$(grep "^KWIN_DRM_DEVICES=" "$ENV_FILE" 2>/dev/null | cut -d= -f2 | tr -d '"' || echo "")

if [[ -z "$CURRENT" ]]; then
    echo "KWIN_DRM_DEVICES not set, defaulting to Intel"
    NEXT="$INTEL:$NVIDIA"
elif [[ "$CURRENT" == "$INTEL:$NVIDIA" ]]; then
    echo "Currently using Intel → switching to NVIDIA"
    NEXT="$NVIDIA:$INTEL"
elif [[ "$CURRENT" == "$NVIDIA:$INTEL" ]]; then
    echo "Currently using NVIDIA → switching to Intel"
    NEXT="$INTEL:$NVIDIA"
else
    echo "Unknown config ($CURRENT), resetting to Intel first"
    NEXT="$INTEL:$NVIDIA"
fi

# Replace or append - escape the backslashes for sed (single \ becomes \\)
ESCAPED_NEXT=$(echo "$NEXT" | sed 's/\\/\\\\/g')

if grep -q "^KWIN_DRM_DEVICES=" "$ENV_FILE"; then
    # Use different delimiter to avoid conflicts with slashes
    sudo sed -i "s|^KWIN_DRM_DEVICES=.*|KWIN_DRM_DEVICES=\"$ESCAPED_NEXT\"|" "$ENV_FILE"
else
    echo "KWIN_DRM_DEVICES=\"$ESCAPED_NEXT\"" | sudo tee -a "$ENV_FILE" >/dev/null
fi

echo "✔ Switched to: $NEXT"
echo "→ Logging out in 3 seconds to apply changes..."

# Countdown with timeout notification
for i in {3..1}; do
    echo -ne "\rLogging out in $i seconds... (Press Ctrl+C to cancel)"
    sleep 1
done
echo -e "\n"

echo "Logging out now..."
if [[ "$XDG_CURRENT_DESKTOP" == "KDE" ]] && command -v qdbus6 >/dev/null 2>&1; then
    qdbus6 org.kde.Shutdown /Shutdown logout
elif [[ "$XDG_CURRENT_DESKTOP" == "KDE" ]] && command -v qdbus >/dev/null 2>&1; then
    qdbus org.kde.ksmserver /KSMServer logout 0 0 0
elif command -v loginctl >/dev/null 2>&1 && [[ -n "$XDG_SESSION_ID" ]]; then
    loginctl terminate-session "$XDG_SESSION_ID"
elif command -v loginctl >/dev/null 2>&1; then
    loginctl kill-user "$USER"
elif [[ "$XDG_CURRENT_DESKTOP" == "KDE" ]] && command -v kquitapp5 >/dev/null 2>&1; then
    kquitapp5 plasmashell && sleep 2 && pkill -TERM -u "$USER"
else
    echo "Could not automatically log out. Please log out manually."
    echo "You may need to run: loginctl terminate-session \$XDG_SESSION_ID"
fi
