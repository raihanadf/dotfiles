#!/bin/sh
# grep device without synaptics
device="$(xinput list | grep -P '(?<= )[\w\s:]*Touchpad(?!.*Synaptics)(?i)(?-i).*?(?=\s*id)' -o | head -n1)"

# enable or disable
[[ "$(xinput list-props "$device" | grep -P ".*Device Enabled.*\K.(?=$)" -o)" == "1" ]] &&
    xinput disable "$device" ||
    xinput enable "$device"

