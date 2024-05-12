#!/bin/bash

set -e

feh -r --randomize --bg-fill "$HOME/Pictures/Wallpapers"

wallpaper=$(cat ~/.fehbg | awk -F "'" '{print $2}')
wal -i $wallpaper --backend wal #haishoku

konsoleprofile colors=WhiteOnBlack
sleep 0.2
konsoleprofile colors=colors-konsole

betterlockscreen -u $wallpaper
