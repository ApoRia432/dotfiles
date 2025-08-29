set fish_greeting

alias xbps-install="sudo xbps-install"
alias xbps-remove="sudo xbps-remove"

export PATH="$HOME/.local/bin:$PATH"

source "$HOME/.cargo/env.fish"

if status is-interactive
    # Commands to run in interactive sessions can go here
end
