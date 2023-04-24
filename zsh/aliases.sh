#!/bin/bash
#Common aliases
alias vi=nvim
alias vid="nvim ."
alias cl=clear
alias py=python
alias g=git
alias gc="git commit -m"
#lsd aliases
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'


#detect distro
if [ -f "/etc/arch-release" ]; then
  alias pacinstall="sudo pacman -S --needed"
  alias pacupdate="sudo pacman -Syu"
  alias pacsearch="pacman -Ss"
  alias pacuninstall="sudo pacman -Rns"
  alias pacunlock="sudo rm /var/lib/pacman/db.lck"
  alias paccleanup='sudo pacman -Rs "$(pacman -Qtdq)"'
  alias aurupdate='yay -Sua'
  alias aurinstall='yay -S'
  alias aursearch='yay -Ss'
  alias auruninstall='yay -Rns'
  alias aurlist="pacman -Qm"
else
# assume ubuntu based
  alias aptinstall="sudo nala install"
  alias aptupdate="sudo nala update"
  alias aptupgrade="sudo nala upgrade"
  alias aptsearch="nala search"
  alias aptuninstall="sudo nala purge"

  alias bat=batcat
  alias fd=fdfind
fi
