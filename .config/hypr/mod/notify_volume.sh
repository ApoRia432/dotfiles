#!/bin/bash

# current_volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}') 
# percentage=$((current_volume * 100))
$percentage="?"

notify-send -h string:x-canonical-private-synchronous:brightness_notification \
            -h int:value:"$percentage" "Volume set to ${percentage}%"
