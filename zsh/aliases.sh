#!/bin/bash
#Common aliases
alias vi=nvim
alias vid="nvim ."
alias cl=clear
alias py=python
#lsd aliases
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'

alias zii="__zoxide_zi"

alias gcom="git commit -m"

#detect distro
if [ -f "/etc/arch-release" ]; then
  aur=yay
  alias paci="sudo pacman -S --needed"
  alias pacu="sudo pacman -Syu"
  alias pacs="pacman -Ss"
  alias pacr="pacman -Rns"
  alias pac_unlock="sudo rm /var/lib/pacman/db.lck"
  alias pac_cleanup='sudo pacman -Rs "$(pacman -Qtdq)"'
  alias auru='"$aur" -Sua'
  alias auri='"$aur" -S'
  alias aurs='"$aur" -Ss'
  alias aurr='"$aur" -Rns'
  alias aurl="pacman -Qm"
else
# assume ubuntu based
  alias apti="sudo nala install"
  alias aptud="sudo nala update"
  alias aptug="sudo nala upgrade"
  alias apts="nala search"
  alias aptr="sudo nala purge"

  alias bat=batcat
  alias fd=fdfind
fi
