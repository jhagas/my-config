#!/bin/bash

STAT=$(acpi -a | awk '{print $3}')
PERCENT=$(upower -i `upower -e | grep 'BAT'` | grep --color=never "percentage" | awk '{print $2}')

if [ "$STAT" = "on-line" ]; then
    ICON=""
else
    ICON=""
fi

echo "$ICON $PERCENT"
