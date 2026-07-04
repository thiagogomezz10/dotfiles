#!/bin/bash

# omarchy:summary=Restart Waybar
# omarchy:examples=omarchy restart waybar

pkill -9 -x hyprpaper
hyprpaper &
