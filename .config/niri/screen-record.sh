#!/bin/bash

OUTPUT_DIR="$HOME/Videos"

if [[ ! -d "$OUTPUT_DIR" ]]; then
    mkdir -p $OUTPUT_DIR
fi

screen_recording() {
  filename="$OUTPUT_DIR/screenrecording-$(date +'%Y-%m-%d_%H-%M-%S').mp4"
  notify-send "Screen recording starting..." -t 1000
  sleep 1

  wf-recorder -f "$filename" -c libx264 -p crf=23 -p preset=medium -p movflags=+faststart "$@"
}

if pgrep -x wf-recorder >/dev/null; then
  pkill -x wf-recorder
  notify-send "Screen recording saved to $OUTPUT_DIR" -t 2000
else
  screen_recording
fi
