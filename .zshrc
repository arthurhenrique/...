export ZSH="/home/arthur/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(git zsh-completions)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

source $HOME/.deps
source $HOME/.profile

[ -z "$TMUX"   ] && { tmux attach || exec tmux new-session && exit; }

