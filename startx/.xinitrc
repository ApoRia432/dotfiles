#!/bin/bash

export DefaultIMModule=fcitx5
export XMODIFIERS=@im=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus

pipewire &
fcitx5 -d &
picom --backend glx &
xrdb merge ~/.Xresources 
feh --bg-fill ~/Pictures/wallpapers/aemeath_together.jpg
dunst -config ~/.config/dunst/mocha.ini &

exec slstatus &
exec dwm
