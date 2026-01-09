#!/bin/bash

# DWM-style workspace - with background highlight on focused

# Colors
BG_FOCUSED=0xff458588      # Blue/teal background for focused (dwm style)
TEXT_FOCUSED=0xffffffff    # White text on focused
TEXT_OCCUPIED=0xffbbbbbb   # Bright for occupied
TEXT_DIM=0xff666666        # Dim for empty

# Get data
FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null | tr -d ' \n')
OCCUPIED=" $(aerospace list-windows --all --format '%{workspace}' 2>/dev/null | sort -u | tr '\n' ' ')"

# Build single sketchybar command
ARGS=""
for i in 1 2 3 4 5 6 7 8 9; do
  # Label: add * if occupied
  if [[ "$OCCUPIED" == *" $i "* ]]; then
    LABEL="${i}*"
    UNFOCUSED_COLOR=$TEXT_OCCUPIED
  else
    LABEL="$i"
    UNFOCUSED_COLOR=$TEXT_DIM
  fi

  # Focused gets background highlight
  if [[ "$i" == "$FOCUSED" ]]; then
    ARGS+=" --set space.$i label=$LABEL label.color=$TEXT_FOCUSED background.drawing=on background.color=$BG_FOCUSED background.corner_radius=4 background.height=20"
  else
    ARGS+=" --set space.$i label=$LABEL label.color=$UNFOCUSED_COLOR background.drawing=off"
  fi
done

sketchybar $ARGS
