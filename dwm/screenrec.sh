#!/usr/bin/env bash

## requirements
# - slurp
# $ xi slurp
# - wl-screenrec
# $ cargo install wl-screenrec
#

OUTPUT_DIR="$HOME/Videos"
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

start_recording() {
    local filename="$OUTPUT_DIR/ScreenRecord-$(date +'%Y-%m-%d_%H-%M-%S').mp4"

    notify-send "Screen recording started."
    gpu-screen-recorder -w screen -f 60 -a "default_output" -o "$filename" &
}

stop_recording() {
    pkill -SIGINT -f "gpu-screen-recorder"
    notify-send "Screen recording saved" "<a href=\"file://$OUTPUT_DIR\">$OUTPUT_DIR</a>"
}

if pgrep -f "gpu-screen-recorder" > /dev/null; then
    stop_recording
else
    start_recording
fi
