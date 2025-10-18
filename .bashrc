# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind ': menu-complete'
bind ': menu-complete-backward'

. "$HOME/.cargo/env"
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/opt/gcc-15/bin:$PATH"
export CC="$(which gcc)"
export CXX="$(which g++)"

alias open="xdg-open"
alias ls="ls --color=auto"
alias xbps-install="sudo xbps-install"
alias xbps-remove="sudo xbps-remove"

git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1='-> \[\e[32m\]\W\[\e[0m\]$(git_branch) $ '

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# starship
# eval "$(starship init bash)"
