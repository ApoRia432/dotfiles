#!/bin/bash

tmux="tmux/.tmux.conf"
bashrc="bash/.bashrc"
inputrc="bash/.inputrc"

ghostty="ghostty"
nvim="nvim"
niri="niri"
mako="mako"
swaybg="swaybg"
waybar="waybar"
hypr="hypr"

link_file() {
    link_file="$(pwd)/${1}"
    file_name="$(basename ${1})"
    link_target="${2}/$file_name"
    if [[ -L "$link_target" ]]; then
        echo -e "$file_name \e[32malready linked\e[0m"
        return
    fi
    if [[ -f "$link_target" ]]; then
        echo "$file_name \e[31mexists\e[0m"
        return
    fi
    # create symbolic link
    ln -s "$link_file" "$link_target" && echo "$file_name \e[32mlinked\e[0m"
}

link_file "$tmux" "$HOME"
link_file "$bashrc" "$HOME"
link_file "$inputrc" "$HOME"

link_file "$ghostty" "$HOME/.config"
link_file "$nvim" "$HOME/.config"
link_file "$niri" "$HOME/.config"
link_file "$mako" "$HOME/.config"
link_file "$waybar" "$HOME/.config"
link_file "$swaybg" "$HOME/.config"
link_file "$hypr" "$HOME/.config"
