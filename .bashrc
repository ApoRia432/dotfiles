# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. "$HOME/.cargo/env"
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.local/bin:$PATH"

alias ls='ls --color=auto'
alias xbps-install="sudo xbps-install"
alias xbps-remove="sudo xbps-remove"

# starship
# eval "$(starship init bash)"
git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1='-> \[\e[32m\]\W\[\e[0m\]$(git_branch) $ '

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
