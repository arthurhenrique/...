export ZSH="/home/arthur/.oh-my-zsh"

ZSH_THEME="maran"

plugins=(git zsh-completions)
autoload -U compinit && compinit


source $ZSH/oh-my-zsh.sh

export PATH="/home/arthur/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export SDKMAN_DIR="/home/arthur/.sdkman"
[[ -s "/home/arthur/.sdkman/bin/sdkman-init.sh" ]] && source "/home/arthur/.sdkman/bin/sdkman-init.sh"

export PATH=$PATH:/usr/local/go/bin:/home/arthur/anaconda3/condabin
export GOPATH=$HOME/go

source $HOME/.profile

[ -z "$TMUX"   ] && { tmux attach || exec tmux new-session && exit; }
