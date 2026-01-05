#!/bin/bash

update_browser() {
    chromium --refresh-platform-policy --no-startup-window > /dev/null 2>&1
    google-chrome-stable --refresh-platform-policy --no-startup-window > /dev/null 2>&1
    brave-browser-stable --refresh-platform-policy --no-startup-window > /dev/null 2>&1
    brave-browser-nightly --refresh-platform-policy --no-startup-window > /dev/null 2>&1
}

echo "Chose your theme (1: Dark, 2: Light)"
echo -e "-> "
read theme

if [ $theme = "1" ]; then
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-Dark'
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    update_browser
    echo "theme set to 'Dark'"
elif [ $theme = "2" ]; then
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
    update_browser
    echo "theme set to 'Light'"
else
    echo "invalid theme: $theme"
fi
