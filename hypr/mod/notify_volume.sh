#!/bin/bash

current_volume=$(echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@) 100" | awk '{print $2 * $3}') 

notify-send -h string:x-canonical-private-synchronous:volume_notification \
            -h int:value:"$current_volume" "Volume set to ${current_volume}%"
