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

    if grid="$(slurp)"; then
        notify-send "Screen recording started."
        wl-screenrec --audio --audio-device alsa_output.pci-0000_00_1f.3.hdmi-stereo.monitor -f "$filename" -g "$grid" &
        # gpu-screen-recorder -w portal -f 60 -a "default_output" -o "$filename" &
    fi
}

stop_recording() {
    pkill -SIGINT -f "wl-screenrec"
    notify-send "Screen recording saved to $OUTPUT_DIR"
}

if pgrep -f "wl-screenrec" > /dev/null; then
    stop_recording
else
    start_recording
fi
