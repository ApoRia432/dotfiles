#!/bin/bash

export XDG_SESSION_TYPE=wayland 
export XDG_CURRENT_DESKTOP=wlroots
export XDG_SESSION_DESKTOP=wlroots
export GTK_THEME=Adwaita:dark
export QT_STYLE_OVERRIDE="Adwaita"

kill_if_exists() {
    if pgrep -x "${1}" > /dev/null; then
        pkill "${1}"
    fi
}

kill_if_exists swaybg
swaybg -m fill -i ~/.config/swaybg/lynae.jpg &

kill_if_exists mako
mako -c ~/.config/mako/mako.ini &

kill_if_exists pipewire
pipewire &

kill_if_exists fcitx5
fcitx5 &

# dbus-update-activation-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
dbus-update-activation-environment --all
