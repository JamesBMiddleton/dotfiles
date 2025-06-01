#!/bin/bash

# change monitor refresh rate
xrandr --output eDP-1 --mode 1920x1200 --rate 59.95 --output DP-3-3 --mode 1920x1080 --rate 140.00
xrandr --dpi 150
rm ~/.Xresources
echo "Xft.dpi: 150" >> ~/.Xresources
