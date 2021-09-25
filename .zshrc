# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="/Users/shiveenp/.oh-my-zsh"
HIST_STAMPS="mm/dd/yyyy"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# HSTR Settings
export HISTFILE=~/.zsh_history
export HSTR_CONFIG=hicolor

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
alias zshrc="subl ~/.zshrc"
alias reload="source ~/.zshrc"
alias copy_ssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias sysupdate='brew update; brew outdated; brew upgrade; brew cleanup; mas upgrade'
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

# node dev
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
