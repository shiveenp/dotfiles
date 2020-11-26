export ZSH="$HOME/.oh-my-zsh"
HIST_STAMPS="mm/dd/yyyy"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

eval $(thefuck --alias)
# HSTR Settings
export HISTFILE=~/.zsh_history
export HSTR_CONFIG=hicolor
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl'
fi

# Personal aliases

## docker
alias dc="docker-compose"

# git aliases
alias gc="git clone"
alias gpull="git pull"
alias gpush="git push"

# hstr aliases
alias hh="hstr"

# jdk aliases
alias switchjdk8="asdf global java adopt-openjdk-8u212-b03"
alias switchjdk11="asdf global java adoptopenjdk-11.0.9+11"
alias switchjdk12="asdf global java adopt-openjdk-12.0.2+10.3"

# misc aliases
alias zshrc="vi ~/.zshrc"
alias reload="source ~/.zshrc"
alias copy_ssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias upda='brew update; brew outdated; brew upgrade; brew cleanup; mas upgrade'
alias clr="clear"
alias rimraf="rm -rf"
alias ls="exa"
alias find="fd"

# Find if a port is in user
function porter {
  command lsof -i:"$@"
}

# Exec into a docker container
function dsh {
    docker exec -it $argv bash
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}

# Rust development
source $HOME/.cargo/env

# pure prompt
autoload -U promptinit; promptinit
prompt pure
