#!/bin/bash

theme_file="chromium/chromium.jsonc"
chrome_dir="/etc/opt/chrome/policies/managed"
chromium_dir="/etc/chromium/policies/managed"

install_chromium() {
    if [[ ! -d $chromium_dir ]]; then
        sudo mkdir -p $chromium_dir
        sudo chmod a+rw $chromium_dir
    fi
    if [[ -f "$chromium_dir/theme.json" ]]; then
        echo "chromium-theme is \e[32malready installed\e[0m"
    else
        cat "$theme_file" > "$chromium_dir/theme.json"
        echo "\e[32msuccess\e[0m to installed chromium theme."
    fi
}

install_chrome() {
    if [[ ! -d $chrome_dir ]]; then
        sudo mkdir -p $chrome_dir
        sudo chmod a+rw $chrome_dir
    fi
    if [[ -f "$chrome_dir/theme.json" ]]; then
        echo "google-chrome theme is \e[32malready installed\e[0m"
    else
        cat "$theme_file" > "$chrome_dir/theme.json"
        echo "\e[32msuccess\e[0m to installed google-chrome theme."
    fi
}


if [[ -f "$theme_file" ]]; then
    install_chromium
    install_chrome
else
    echo -e "\e[1m$theme_file\e[0m does \e[31m\e[1mnot\e[0m exists."
fi
