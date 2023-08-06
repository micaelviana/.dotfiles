#!/usr/bin/env bash
#EXPORTS
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"
export EDITOR=nvim
export SUDO_EDITOR=nvim
export PATH="$HOME/.local/bin:$PATH"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"