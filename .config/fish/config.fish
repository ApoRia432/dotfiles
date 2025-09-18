set fish_greeting 

export EDITOR="nvim"

fish_add_path $HOME/.local/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
fish_add_path /Users/yonagi/.local/bin
