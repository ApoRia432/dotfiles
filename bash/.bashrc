# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bind ': menu-complete'
bind ': menu-complete-backward'
bind ': forward-word'
bind ': backward-word'
shopt -s autocd

. "$HOME/.cargo/env"
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/opt/gcc-15/bin:$PATH"
export CC="$(which gcc)"
export CXX="$(which g++)"
export EDITOR=nvim

alias v="nvim"
alias open="xdg-open"
alias ls="ls --color=auto"
alias grep='grep --color=auto'
alias xbps-install="sudo xbps-install"
alias xbps-remove="sudo xbps-remove"
alias glog="git log"
alias gad="git add"
alias gst="git status"
alias gsw="git swtich"
alias gcm="git commit"
alias gcma="git commit --amend"
alias grst="git reset"
alias gri="gir rebase -i"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias gpush="git push -u origin HEAD"
alias gpf="git push --force-with-lease origin HEAD"

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

# pnpm
export PNPM_HOME="/home/aemeath/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
