#!/bin/sh

#
# ~/.xsession
#
# Executed by xdm/gdm/kdm at login

systemctl --user import-environment DISPLAY &

xrandr --newmode "1368x768_60.00"   85.25  1366 1440 1576 1784  768 771 781 798
xrandr --addmode VGA1 1368x768_60.00
xrandr --output VGA1 --mode 1368x768_60.00 --right-of eDP1

export CM_LAUNCHER=rofi
xset r rate 300 100

