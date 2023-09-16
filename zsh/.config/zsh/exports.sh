#!/usr/bin/env bash
#EXPORTS
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"
export EDITOR=nvim
export SUDO_EDITOR=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

#from ThePrimeagen: add a folder to PATH
addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}
addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}
addToPath "$HOME"/.local/bin
addToPath /mnt/c/Users/Micael/AppData/Local/shims
