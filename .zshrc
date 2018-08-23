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

# docker-compose
alias dc="docker-compose"

# heroku
alias h="heroku"

# sequelize
alias s="subl3"

# ls
alias l="ls"
alias ls="ls --color"

# Yaourt
alias y="yaourt"
alias ys="yaourt -S"

alias nt="npm test -- --watch"

alias wifiStat="vnstat -q"

# ssh-agent
alias ssha="ssh-add $HOME/.ssh/id_rsa"

# copy to clipboard
alias cpy='xsel -ib'

# Add RBENV to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rbenv/bin:$HOME/.cargo/bin"
eval "$(rbenv init -)"

DEFAULT_USER=`whoami`

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export WTF_GITHUB_TOKEN=44472e6d9f4cdccd162a8066c8ed81a3e4134697
export WTF_JIRA_API_TOKEN=U7C4hTLSYYbHhiY2sWoQ0502
