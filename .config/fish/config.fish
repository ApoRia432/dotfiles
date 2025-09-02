set fish_greeting

# alisa for xbps
alias xbps-install="sudo xbps-install"
alias xbps-remove="sudo xbps-remove"

# golang
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$GOPATH/bin"

# .local/bin
export PATH="$HOME/.local/bin:$PATH"

source "$HOME/.cargo/env.fish"


if status is-interactive
    # Commands to run in interactive sessions can go here
end

# opencode
fish_add_path /home/iuno/.opencode/bin
