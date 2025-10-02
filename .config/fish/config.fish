set fish_greeting

export EDITOR=vim

# alisa for xbps
alias xbps-install="sudo xbps-install"
alias xbps-remove="sudo xbps-remove"

# golang
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$GOPATH/bin"

# .local/bin
fish_add_path $HOME/.local/bin

source "$HOME/.cargo/env.fish"

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# opencode
fish_add_path /home/iuno/.opencode/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# node
nvm use latest > /dev/null
