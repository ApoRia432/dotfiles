#!/bin/bash

link_file() {
    link_file="$(pwd)/${1}"
    file_name="$(basename ${1})"
    link_target="${2}/$file_name"
    if [[ -L "$link_target" ]]; then
        echo -e "$file_name \e[32malready linked\e[0m"
        return
    fi
    if [[ -f "$link_target" ]]; then
        echo -e "$file_name \e[31mexists\e[0m"
        return
    fi
    # create symbolic link
    ln -s "$link_file" "$link_target" && echo -e "$file_name \e[32mlinked\e[0m"
}

link_file "tmux/.tmux.conf" "$HOME"
link_file "bash/.bashrc" "$HOME"
link_file "bash/.inputrc" "$HOME"
link_file "startx/.xinitrc" "$HOME"

link_file "dunst" "$HOME/.config"
link_file "picom" "$HOME/.config"
link_file "dwm" "$HOME/.config"
