#!/usr/bin/env bash 

# Default configuration for 3 screens
xrandr --output HDMI-2 --primary --output DP-1 --left-of HDMI-2 --output eDP-1 --right-of HDMI-2

# systray volume, battery, wifi icon
volumeicon &
cbatticon -u 5 &
nm-applet &

# Start teams always
teams &
