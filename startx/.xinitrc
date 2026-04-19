#!/bin/bash

export DefaultIMModule=fcitx5
export XMODIFIERS=@im=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

xrandr --output DisplayPort-0 --mode 2560x1440 --rate 180
xrandr --output HDMI-A-0 --right-of DisplayPort-0 --rate 144 --scale 1.333x1.333

pipewire &
fcitx5 -d &
picom --backend glx &
xrdb merge ~/.Xresources 
feh --bg-fill ~/Pictures/wallpapers/Mornye\ Polar\ Research\ FRover.jpg
dunst -config ~/.config/dunst/mocha.ini &

xsetroot -cursor_name left_ptr

exec slstatus &
exec dwm
