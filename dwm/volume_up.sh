#!/bin/bash

wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2 * 100}')
notify-send -r 9992 "Volume Up" "Current volume: ${volume}%"