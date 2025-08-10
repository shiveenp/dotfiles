# Startship prompt
eval "$(starship init zsh)"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-fzf-history-search z)


source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases

# System
alias zshrc="vim ~/.zshrc"
alias reload="source ~/.zshrc"
alias system-update='brew update; brew outdated; brew upgrade; brew cleanup; mas upgrade'

# Git
alias gc="git clone"
alias gpull="git pull"
alias gpush="git push"

## docker
alias dc="docker-compose"

## terraform
alias tf="terraform"

# SSH
alias ssh_homelab="ssh shiveenp@192.168.4.231"

# Utility Functions
function porter {
  command lsof -i:"$@"
}

# NVM Integration
"~/.zshrc" 50L, 1136B
