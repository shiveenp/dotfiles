# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes


# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

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
  export EDITOR='code'
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


# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Rust development
source $HOME/.cargo/env

# starship prompt
eval "$(starship init zsh)"