#!/bin/bash

OUTPUT_DIR="$HOME/Videos"

if [[ ! -d "$OUTPUT_DIR" ]]; then
    mkdir -p $OUTPUT_DIR
fi

screenrecording() {
  filename="$OUTPUT_DIR/screenrecording-$(date +'%Y-%m-%d_%H-%M-%S').mp4"
  notify-send "Screen recording starting..." -t 1000
  sleep 1

  if lspci | grep -Eqi 'nvidia|intel.*graphics'; then
    wf-recorder -f "$filename" -c libx264 -p crf=23 -p preset=medium -p movflags=+faststart "$@"
  else
    wl-screenrec -f "$filename" --ffmpeg-encoder-options="-c:v libx264 -crf 23 -preset medium -movflags +faststart" "$@"
  fi
}

if pgrep -x wl-screenrec >/dev/null || pgrep -x wf-recorder >/dev/null; then
  pkill -x wl-screenrec
  pkill -x wf-recorder
  notify-send "Screen recording saved to $OUTPUT_DIR" -t 2000
else
  screenrecording
fi
