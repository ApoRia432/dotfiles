#!/bin/bash

echo "Chose your theme (1: Dark, 2: Light)"
echo -e "-> "
read theme

if [ $theme = "1" ]; then
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    echo "theme set to 'Dark'"
elif [ $theme = "2" ]; then
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    echo "theme set to 'Light'"
else
    echo "invalid theme: $theme"
fi
