#!/bin/bash

kill_if_exists() {
    if pgrep -x "${1}" > /dev/null; then
        pkill "${1}"
    fi
}

kill_if_exists swaybg
swaybg -m fill -i ~/.config/swaybg/chisa.png &

kill_if_exists mako
mako -c ~/.config/mako/mako.ini &

kill_if_exists pipewire
pipewire &

kill_if_exists fcitx5
fcitx5 &
