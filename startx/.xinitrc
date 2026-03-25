#!/bin/bash

export DefaultIMModule=fcitx5
export XMODIFIERS=@im=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

xrandr --output DisplayPort-0 --mode 1920x1080 --rate 240
xrandr --output HDMI-A-0 --right-of DisplayPort-0 --auto

pipewire &
fcitx5 -d &
picom --backend glx &
xrdb merge ~/.Xresources 
feh --bg-fill ~/Pictures/wallpapers/hiyuki.jpeg
dunst -config ~/.config/dunst/mocha.ini &

exec slstatus &
exec dwm
