# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/chillaso/.oh-my-zsh"
#ZSH_THEME="muse"
ZSH_THEME="powerlevel10k/powerlevel10k"

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

plugins=(git docker docker-compose kubectl golang copyfile helm zsh-vi-mode sudo)

source $ZSH/oh-my-zsh.sh

# ALIAS
alias actualizar="sudo apt-get update && sudo apt-get upgrade -y"
alias limpiar="sudo apt-get autoremove -y"
alias apagar="actualizar && limpiar && poweroff"
alias python="python3.8"
alias aws-ecr-token="aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 172380189452.dkr.ecr.eu-west-1.amazonaws.com"
alias sct="scrot -s -o /tmp/sct.png; xclip -sel clipboard -target image/png /tmp/sct.png"
alias config="vim ~/.zshrc"
alias update-config="source ~/.zshrc"
alias epo="cd ~/epo/pins"
alias kd="cd ~/epo/pins/kd-pins"
alias dckrminone="docker rmi $(docker images | awk '{print $2"-"$3}' | grep \<none\> | sed 's/<none>-//')"
alias kdebug="kubectl run -i --tty --rm debug --image=busybox --restart=Never -- sh"
alias xclip="xclip -selection clipboard"


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
alias cat="batcat"
alias lcat="/usr/bin/cat"


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
export PATH=/opt/apache-maven-3.8.2/bin:$HOME/.krew/bin:$HOME/bin:$PATH

# PUPPETEER
export GOOGLE_CHROME_DATA_DIR="/home/chillaso/.config/google-chrome/Default/Local Storage"
export GOOGLE_CHROME_BIN="/usr/bin/google-chrome"

# FUNCTIONS
# Extract nmap information
# Run as: 
# extractPorts allPorts
function extractPorts(){
	ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
	ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
	echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
	echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
	echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
	echo $ports | tr -d '\n' | xclip -sel clip
	echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
	cat extractPorts.tmp; rm extractPorts.tmp
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/home/chillaso/.gvm/go/bin:$PATH"