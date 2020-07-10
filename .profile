#!/bin/bash

#######################################################################
# Alias
#######################################################################
# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -iv'
alias mkdir='mkdir -p'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias apt-get='sudo apt-get'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias vi='vim'
alias svi='sudo vi'
alias vis='vim "+set si"'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# # Alias's for multiple directory listing commands
alias la='ls -Alh' # show hidden files
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search command line history
alias h="history | grep "

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Alias's for git
alias gs='git status'
alias ga='git add '
alias gb='git branch '
alias gc='git commit '
alias gd='git diff '
alias gco='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all '
alias git_copy_last_hash='git log -1 --pretty=%H | clipcopy'

alias gitkrak='export REPO=$(git remote get-url --all origin); echo $REPO; git remote remove origin; gitkraken -p $(pwd) && git remote add origin "$REPO"; git remote -v'
alias got='git '
alias get='git '

# SHA1
alias sha1='openssl sha1'

# EDITOR
# vim
export EDITOR=nvim
alias vimdiff='nvim -d'
alias vim="nvim"
alias vi="nvim"


# MAC
if [[ `uname -s` == "Darwin" ]]; then
	alias gitkraken="open -a GitKraken"
	alias code="open -a Visual\ Studio\ Code.app"
fi

# VPN
alias vpn="cd ~/vpn; nohup ./fortisslvpn.sh &; cd -"

# K8s
alias pods='kubectl get pods -n'
alias deployments='kubectl get deployments -n'
alias kjobs='kubectl get jobs -n'
alias redis='docker run -it --rm redis redis-cli -p 6379'
alias psql='docker run -it --rm -v /tmp:/tmp postgres psql'
alias sqlcmd='docker run --rm --network=bridge -it mcr.microsoft.com/mssql-tools /opt/mssql-tools/bin/sqlcmd'

#######################################################################
# FUNCTIONS
#######################################################################
logs() {
  kubectl -n $1 logs -f $2
}

rollout_history() {
  kubectl -n $1 rollout history deployment.v1.apps/$2
}

rollout_undo() {
  kubectl -n $1 rollout undo deployment.v1.apps/$2
}

apply_deploy() {
  kubectl -n $1 apply -f $2
}

describe_pod() {
  kubectl -n $1 describe pod $2
}

docker_rm_exited() {
  docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm
}

pyclean () {
    find . | grep -E "(__pycache__|\.egg-info|build|dist|\.pyc|\.pyo$)" | xargs rm -rf
}

dockercleanup(){
    docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
    docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
}


#######################################################################
# Init
#######################################################################
# ASDF
source $HOME/.asdf/asdf.sh
# Python
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$PATH:$HOME/anaconda3/condabin"
# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/go"
# Rust
export PATH="$HOME/.cargo/bin:$PATH"
# JVM
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#######################################################################
# Scripting
#######################################################################
# Price monitoring
alias cadeira='if [[ ! -e /tmp/"$(date +"%m-%d-%y")" ]];
then
    touch /tmp/"$(date +"%m-%d-%y")"
    export price_vega_preta="$(curl https://www.kabum.com.br/cgi-local/site/produtos/descricao.cgi\?codigo\=81454\&origem\=48 | grep -Po "price\":(\d+\.\d+)" | cut -d: -f2)"
    export price_vega_blue="$(curl  https://www.kabum.com.br/cgi-local/site/produtos/descricao.cgi\?codigo\=81455\&origem\=48  | grep -Po "price\":(\d+\.\d+)" | cut -d: -f2)"
    clear
    echo \[PRICE ALERT\] cadeira vega preta: $price_vega_preta | tee -a /tmp/"$(date +"%m-%d-%y")"
    echo \[PRICE ALERT\] cadeira vega azul: $price_vega_blue | tee -a /tmp/"$(date +"%m-%d-%y")"
    sleep 15
fi'
