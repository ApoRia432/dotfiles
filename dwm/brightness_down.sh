#!/bin/bash

brightnessctl set 5%-
brightness=$(brightnessctl get)
max=$(brightnessctl max)
percent=$((($brightness * 100 + $max / 2) / $max))
percent=$(( (percent + 2) / 5 * 5 ))
notify-send -r 9991 "Brightness Down" "Current brightness: ${percent}%"
