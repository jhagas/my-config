#!/bin/sh

sudo pacman -Syu lm-sensors thinkfan

sudo echo "options thinkpad_acpi fan_control=1" > /etc/modprobe.d/thinkfan.conf
modprobe thinkpad_acpi

sudo systemctl enable lm_sensors
sudo systemctl enable thinkfan
