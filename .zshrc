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
alias d="docker"
alias dc="docker-compose"
alias k="kubectl"

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
alias gpf="git push --force-with-lease"
alias gst="git status"
alias gd="git diff"

# apply defaut stash on station project
alias gi="git stash apply stash^{/init_station_master-hr}"

# docker-compose
alias dc="docker-compose"

# heroku
alias h="heroku"

# sequelize
alias s="subl3"

# ls
alias l="ls"
alias ls="ls --color"

# yay
alias y="yay"
alias ys="yay -S"

alias nt="npm test -- --watch"

alias wifiStat="vnstat -q"

# ssh-agent
alias ssha="ssh-add $HOME/.ssh/id_rsa"

# copy to clipboard
alias cpy='xsel -ib'


DEFAULT_USER=`whoami`

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
