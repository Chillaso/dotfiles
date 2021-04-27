#!/usr/bin/env bash 
xrandr --output HDMI-2 --primary --output DP-1 --left-of HDMI-2 --output eDP-1 --right-of HDMI-2
festival --tts $HOME/.config/qtile/welcome_msg &
lxsession &
picom &
nitrogen --restore &
/usr/bin/emacs --daemon &
volumeicon &
nm-applet &
teams &
