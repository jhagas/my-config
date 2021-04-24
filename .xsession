#!/bin/sh

#
# ~/.xsession
#
# Executed by xdm/gdm/kdm at login

systemctl --user import-environment DISPLAY &

export CM_LAUNCHER=rofi
xset r rate 300 100

