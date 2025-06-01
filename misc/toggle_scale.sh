#!/bin/bash

SCALING_CONFIG="$HOME/.config/kdeglobals"
FONT_CONFIG="$HOME/.config/kcmfonts"

TOGGLE="$HOME/Documents/scripts/.scale_toggle"

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    FORCE_FONT_DPI="144"
    SCALING="1.5"
    SCREEN_SCALE_FACTORS="eDP-1=1.5;DP-1=1.5;HDMI-1=1.5;DP-2=1.5;DP-3=1.5;DP-4=1.5;"
else
    rm $TOGGLE
    FORCE_FONT_DPI="96"
    SCALING="1"
    SCREEN_SCALE_FACTORS="eDP-1=1;DP-1=1;HDMI-1=1;DP-2=1;DP-3=1;DP-4=1;"
fi

kwriteconfig5 --file $SCALING_CONFIG --group "KScreen" --key "ScaleFactor" "$SCALING"
kwriteconfig5 --file $SCALING_CONFIG --group "KScreen" --key "ScreenScaleFactors" "$SCREEN_SCALE_FACTORS"
kwriteconfig5 --file $FONT_CONFIG --group "General" --key "forceFontDPI" "$FORCE_FONT_DPI"

qdbus org.kde.Shutdown /Shutdown logout

# Resources:
# https://forum.kde.org/viewtopic.php?t=164455
# https://askubuntu.com/questions/147080/shell-script-to-toggle-between-two-commands
# https://askubuntu.com/questions/1871/how-can-i-safely-shutdown-reboot-logout-kde-from-the-command-line
#
# "if the blank file ".scale_toggle" exists, set scaling to 1 and remove it,
# if it doesn't exist, set scaling to 1.5 and create it,
# then logout".
