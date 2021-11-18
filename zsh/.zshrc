export ZSH="/home/chillaso/.oh-my-zsh"
ZSH_THEME="muse"

zmodload zsh/complist
autoload -U compinit
compinit

# history setup
setopt SHARE_HISTORY
HISTFILE=$HOME/.zsh_history
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

# CTRL K CTRL J SEARCH HISTORY
function zvm_after_init() {
  bindkey '^K' history-beginning-search-backward
  bindkey '^J' history-beginning-search-forward
  bindkey -M menuselect 'h' vi-backward-char
  bindkey -M menuselect 'k' vi-up-line-or-history
  bindkey -M menuselect 'l' vi-forward-char
  bindkey -M menuselect 'j' vi-down-line-or-history
}

fpath=(~/.zsh/completion $fpath)

plugins=(git docker docker-compose kubectl golang copyfile helm zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

# ALIAS
alias actualizar="sudo apt-get update && sudo apt-get upgrade -y"
alias limpiar="sudo apt-get autoremove -y"
alias apagar="actualizar && limpiar && poweroff"
alias python="python3.8"
alias aws-ecr-token="aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 172380189452.dkr.ecr.eu-west-1.amazonaws.com"
alias sct="gnome-screenshot -acf /tmp/test && xclip -selection clipboard -target image/png /tmp/test"
alias config="vim ~/.zshrc"
alias update-config="source ~/.zshrc"

# ALIAS DE SHORTCUTS
alias dc="docker-compose"
alias dck="docker"
alias k="kubectl"
alias salary="/home/chillaso/proyectos/salary-calc/salary-calc"
alias cdp="cd ~/proyectos/"
alias rs="cd ~/proyectos/restock/"
alias citrix="/opt/Citrix/ICAClient/selfservice"
alias pulse="/usr/local/pulse/pulseUi"
alias intellij="sh /opt/intellij/bin/idea.sh"


# NVM completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# GVM
[[ -s "/home/chillaso/.gvm/scripts/gvm" ]] && source "/home/chillaso/.gvm/scripts/gvm"

# Pulsesecure
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/pulse/extra/usr/lib/x86_64-linux-gnu/

# Kubeconfig
#export KUBECONFIG=$HOME/.kube/config
export KUBECONFIG=$HOME/.kube/config.cluster-merge:$HOME/.kube/config.chilla:$HOME/.kube/config.endurance:$HOME/.kube/config.batavia:$HOME/.kube/config.mylocal

alias k=kubectl
complete -F __start_kubectl k

# PATH
export PATH=/opt/apache-maven-3.8.2/bin:$HOME/.krew/bin:$PATH
