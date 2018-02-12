#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# General
alias r="ranger"

# Git
alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gc="git commit"
alias gca="git commit --amend"
alias gco="git checkout"
alias gf="git fetch"
alias glog="git log"
alias glg="git lg"
alias gl="git pull"
alias gp="git push"
alias gst="git status"
alias gd="git diff"

# docker-compose
alias dc="docker-compose"

# ls
alias l="ls"
alias ls="ls --color"

# Yaourt
alias y="yaourt"
alias ys="yaourt -S"

alias nt="npm test -- --watch"

alias gpfe=~/dots/scripts/push_fe.sh
alias wifiStat="vnstat -q"

# ssh-agent
alias ssha="ssh-add $HOME/.ssh/id_rsa"

# Add RBENV to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rbenv/bin"
eval "$(rbenv init -)"
