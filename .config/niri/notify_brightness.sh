#!/bin/bash

max_brightness=$(brightnessctl max)
current_brightness=$(brightnessctl gget)
percentage=$((current_brightness * 100 / max_brightness))


notify-send -h string:x-canonical-private-synchronous:brightness_notification \
            -h int:value:"$percentage" "Brightness set to ${percentage}%"
