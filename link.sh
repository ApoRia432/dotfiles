#!/bin/bash

tmux="tmux/.tmux.conf"
bash_rc="bash/.bashrc"
bash_profile="bash/.bash_profile"

ghostty="ghostty"
nvim="nvim"
rift="rift"
ripgrep="ripgrep/.ripgreprc"
aerospace="aerospace"
skhd="skhd"

link_file() {
    link_file="$(pwd)/${1}"
    file_name="$(basename ${1})"
    link_target="${2}/$file_name"
    if [[ -L "$link_target" ]]; then
        echo -e "$file_name \033[32malready linked\033[0m"
        return
    fi
    if [[ -f "$link_target" ]]; then
        echo -e "$file_name \033[31mexists\033[0m"
        return
    fi
    # create symbolic link
    ln -s "$link_file" "$link_target" && echo -e "$file_name \033[32mlinked\033[0m"
}

link_file "$tmux" "$HOME"
link_file "$bash_rc" "$HOME"
link_file "$bash_profile" "$HOME"
link_file "$ripgrep" "$HOME"

link_file "$rift" "$HOME/.config"
link_file "$ghostty" "$HOME/.config"
link_file "$nvim" "$HOME/.config"
link_file "$aerospace" "$HOME/.config"
link_file "$skhd" "$HOME/.config"
