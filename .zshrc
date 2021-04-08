# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
 export ZSH="/home/chillaso/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="muse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

#DOCKER
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose kubectl golang)

source $ZSH/oh-my-zsh.sh

# ALIAS
alias actualizar="sudo apt-get update && sudo apt-get upgrade -y"
alias limpiar="sudo apt-get autoremove -y"
alias apagar="actualizar && limpiar && poweroff"
alias python="python3.8"
alias aws-ecr-token="aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 172380189452.dkr.ecr.eu-west-1.amazonaws.com"

# ALIAS DE SHORTCUTS
alias dc="docker-compose"
alias dck="docker"
alias k="kubectl"
alias salary="/home/chillaso/proyectos/salary-calc/salary-calc"
alias cdp="cd ~/proyectos/"
alias rs="cd ~/proyectos/restock/"

# NVM completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# GVM
[[ -s "/home/chillaso/.gvm/scripts/gvm" ]] && source "/home/chillaso/.gvm/scripts/gvm"

# Pulsesecure
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/pulse/extra/usr/lib/x86_64-linux-gnu/
# Kubeconfig
export KUBECONFIG=$HOME/.kube/config

alias k=kubectl
complete -F __start_kubectl k

export PATH=/home/chillaso/.gvm/bin:/home/chillaso/.nvm/versions/node/v14.16.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/intellij/bin/idea.sh
