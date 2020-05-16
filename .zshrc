export ZSH="/home/arthur/.oh-my-zsh"

ZSH_THEME="spaceship"
source $ZSH/oh-my-zsh.sh

plugins=(git zsh-completions)
autoload -U compinit && compinit

source $HOME/.deps
source $HOME/.profile

[ -z "$TMUX"   ] && { tmux attach || exec tmux new-session && exit; }

