#!/bin/bash

export ZSH="/home/arthur/.oh-my-zsh"
ZSH_THEME="spaceship"

source "$ZSH/oh-my-zsh.sh"
plugins=(git zsh-completions)

[ -z "$TMUX" ] && { tmux attach || exec tmux new-session && exit; }

source "$HOME/.deps"
source "$HOME/.profile"
