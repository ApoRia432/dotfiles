#!/usr/bin/env bash

## requirements
# - slurp
# $ xi slurp
# - wl-screenrec
# $ cargo install wl-screenrec
#

OUTPUT_DIR="$HOME/Pictures/Screenshots"
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

start_capture() {
    local filename="$OUTPUT_DIR/Screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"

    if grid="$(slurp)"; then
        notify-send
        grim -g "$grid" - |
            satty --filename - \
            --output-filename "$filename" \
            --early-exit \
            --actions-on-enter save-to-clipboard \
            --actions-on-escape exit \
            --copy-command 'wl-copy'
    fi
}

if ! [[ $(pgrep -x "slurp" > /dev/null) ]]; then
    start_capture
fi
