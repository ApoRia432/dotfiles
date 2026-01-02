#!/bin/bash

brave_dir="/etc/brave/policies/managed"
chrome_dir="/etc/opt/chrome/policies/managed"
chromium_dir="/etc/chromium/policies/managed"

function show_themes() {
    index=1
    for f in ./chromium/*; do
        echo "$index: $(echo $f | awk -F '/' '{print $3}')"
        (( index++ ))
    done
}

function set_theme() {
    target_dir=${1}
    theme_index=${2}
    index=1
    for theme_file in ./chromium/*; do
        if echo $theme_index | grep -qx $index; then
            install_theme $target_dir $theme_file
            return 0
        fi
        (( index++ ))
    done
    echo "invalid theme"
    return 1
}

install_theme() {
    target_dir=${1}
    theme_file=${2}
    if [[ ! -d $target_dir ]]; then
        sudo mkdir -p $target_dir
        sudo chmod a+rw $target_dir
    fi
    cat "$theme_file" > "$target_dir/theme.json"
}

update_browser() {
    chromium --refresh-platform-policy --no-startup-window /dev/null 2>&1
    google-chrome-stable --refresh-platform-policy --no-startup-window /dev/null 2>&1
    brave-browser-stable --refresh-platform-policy --no-startup-window /dev/null 2>&1
}

echo -e "Select theme"
show_themes
echo -n " > "

read theme

set_theme $brave_dir $theme
set_theme $chrome_dir $theme
set_theme $chromium_dir $theme

echo -e "\e[32msuccess\e[0m to installed $target_dir theme."

update_browser
