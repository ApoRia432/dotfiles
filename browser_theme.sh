#!/bin/bash

theme_file="chromium/chromium.json"
chrome_dir="/etc/opt/chrome/policies/managed"
brave_dir="/etc/brave/policies/managed"
chromium_dir="/etc/chromium/policies/managed"

install_chromium() {
    if [[ ! -d $chromium_dir ]]; then
        sudo mkdir -p $chromium_dir
        sudo chmod a+rw $chromium_dir
    fi
    if [[ -f "$chromium_dir/theme.json" ]]; then
        echo -e "chromium-theme is \e[32mupdated\e[0m"
    else
        echo -e "\e[32msuccess\e[0m to installed chromium theme."
    fi
    cat "$theme_file" > "$chromium_dir/theme.json"
}

install_chrome() {
    if [[ ! -d $chrome_dir ]]; then
        sudo mkdir -p $chrome_dir
        sudo chmod a+rw $chrome_dir
    fi
    if [[ -f "$chrome_dir/theme.json" ]]; then
        echo -e "google-chrome theme is \e[32mupdated\e[0m"
    else
        echo -e "\e[32msuccess\e[0m to installed google-chrome theme."
    fi
    cat "$theme_file" > "$chrome_dir/theme.json"
}

install_brave() {
    if [[ ! -d $brave_dir ]]; then
        sudo mkdir -p $brave_dir
        sudo chmod a+rw $brave_dir
    fi
    if [[ -f "$brave_dir/theme.json" ]]; then
        echo -e "brave-browser theme is \e[32mupdated\e[0m"
    else
        echo -e "\e[32msuccess\e[0m to installed brave-browser theme."
    fi
    cat "$theme_file" > "$brave_dir/theme.json"
}

update_browser() {
    chromium --refresh-platform-policy --no-startup-window /dev/null 2>&1
    google-chrome-stable --refresh-platform-policy --no-startup-window /dev/null 2>&1
    brave-browser-stable --refresh-platform-policy --no-startup-window /dev/null 2>&1
}

if [[ -f "$theme_file" ]]; then
    install_chromium
    install_chrome
    install_brave
    update_browser
else
    echo -e "\e[1m$theme_file\e[0m does \e[31m\e[1mnot\e[0m exists."
fi
