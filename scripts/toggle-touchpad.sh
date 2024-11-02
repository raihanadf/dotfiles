#!/bin/sh
# grep device without synaptics
device="$(xinput list | grep -P '(?<= )[\w\s:]*Touchpad(?!.*Synaptics)(?i)(?-i).*?(?=\s*id)' -o | head -n1)"

# enable or disable
[ -f /tmp/touchpad_disabled ] && xinput enable "$device" && rm /tmp/touchpad_disabled || xinput disable "$device" && touch /tmp/touchpad_disabled
