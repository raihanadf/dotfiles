#!/bin/bash

iconPath="$HOME/.dotfiles/scripts/pomo/"

dunstify "Yoooooooo!!!" "It's time to do all ur things, let's gooooo. Rest later after 30 mins." -i $iconPath/tomato.png
sleep 1800
dunstify "Rest Time!" "Do what u wanna do" -h string:fgcolor:#ff4444 -h string:frcolor:#ba0606 -i $iconPath/stop.png
sleep 600
dunstify "Rest Time Over" "It's been 10 mins" -h string:fgcolor:#ff4444 -h string:frcolor:#ba0606 -i $iconPath/stop.png

