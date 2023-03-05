#!/bin/bash
#EXPORTS
export EDITOR=nvim
export SUDO_EDITOR=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"

[ -f "$HOME/.asdf/asdf.sh" ]  && . "$HOME/.asdf/asdf.sh"
