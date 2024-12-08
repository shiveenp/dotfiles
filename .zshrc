# Load pure prompt
autoload -U promptinit; promptinit
prompt pure

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

# Utility Functions
function porter {
  command lsof -i:"$@"
}
# NVM Integration
export NVM_DIR="$HOME/.nvm"
   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
