#!/usr/bin/env bash
#Common aliases
alias vi="nvim"
alias vid="nvim ."
alias vif='fd --type f --hidden --exclude .git --exclude .vscode --exclude node_modules --print0 | fzf --layout=reverse --height=50% --read0 --print0 --exit-0 | xargs -r -0 nvim'
alias c="clear"
alias py="python"
alias cat='bat'
alias zshr="exec zsh"
alias myip="curl http://ipecho.net/plain; echo"
alias usage='du -h -d1'
alias rm='trash-put'
alias g="git"
alias gc="git clone --recurse-submodules"
alias gau="git add -u"
alias gp="git push origin HEAD"
alias gpl="git pull"
alias gs="git status"
#lsd aliases
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'

#detect distro
if [ -f "/etc/arch-release" ]; then
  alias pacin="sudo pacman -S --needed"
  alias pacud="sudo pacman -Syu"
  alias pacse="pacman -Ss"
  alias pacre="sudo pacman -Rns"
  alias pacun="sudo rm /var/lib/pacman/db.lck"
  alias paccl='sudo pacman -Rs "$(pacman -Qtdq)"'
  alias aurup='yay -Sua'
  alias aurin='yay -S'
  alias aurse='yay -Ss'
  alias aurre='yay -Rns'
  alias aurli="pacman -Qm"
else
# assume ubuntu based
  alias aptin="sudo nala install"
  alias aptud="sudo nala update"
  alias aptupg="sudo nala upgrade"
  alias aptse="nala search"
  alias aptre="sudo nala purge"

  alias bat=batcat
  alias fd=fdfind
fi
