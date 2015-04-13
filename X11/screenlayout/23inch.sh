#!/bin/sh
sed -i '/minimum_size/s/ [0-9]*/ 1920/' ~/.config/conky/conkyrc
xrandr --output LVDS1 --off --output TV1 --off --output VGA1 --mode 1920x1080 --pos 0x0 --rotate normal
