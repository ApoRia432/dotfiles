# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind 'set show-all-if-ambiguous on'

bind ': menu-complete'
bind ': menu-complete-backward'
bind ': forward-word'
bind ': backward-word'

export CC="$(which gcc)"
export CXX="$(which g++)"
export EDITOR=nvim

alias ls="ls --color=auto"
alias grep='grep --color=auto'
alias gcm="git commit"
alias gcma="git commit --amend"
alias grbc="git rebase --continue"
alias gpf="git push --force-with-lease origin HEAD"

git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1='-> \[\e[32m\]\W\[\e[0m\]$(git_branch) $ '

# bash completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

. "$HOME/.cargo/env"
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/opt/gcc-15/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/bin/:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

