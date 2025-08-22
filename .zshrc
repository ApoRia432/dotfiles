export ZSH="$HOME/.oh-my-zsh"
# Paths for golang
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOPATH/bin
# Path for zig
export PATH=$PATH:~/path/to/zig
# config home
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_BIN_DIR="$HOME/.local/bin"
# .local/bin
export PATH="$PATH:$HOME/.local/bin"
# input method
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export SDL_IM_MODULE=fcitx5
export DOCKER_BUILDKIT=1

export EDITOR=vim

alias vi=vim
alias nv=nvim

ZSH_THEME="robbyrussell"

plugins=(git history)

source $ZSH/oh-my-zsh.sh

# bun completions
[ -s "/home/rimuru/.bun/_bun" ] && source "/home/rimuru/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#rust
export PATH=$HOME/.cargo/bin:$PATH

source ~/.env

# opencode
export PATH=/home/hysilens/.opencode/bin:$PATH
