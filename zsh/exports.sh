#!/bin/bash
#EXPORTS
export EDITOR=nvim
export SUDO_EDITOR=nvim

export PATH="$HOME/.local/bin:$PATH"

eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"
