#!/bin/sh
sed -i '/minimum_size/s/ [0-9]*/ 1280/' ~/.config/conky/conkyrc
xrandr --output LVDS1 --mode 1280x800 --pos 0x0 --rotate normal --output TV1 --off --output VGA1 --off
