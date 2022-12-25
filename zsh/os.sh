#!/usr/bin/env bash

info=$(uname -a)
os="WSL"

#detect specific os
if grep -q "$os" <<< "$info"; then #check Windows-WSL
  #redefine clipcopy
  clipcopy () {
        clip.exe < "${1:-/dev/stdin}"
  }
  #redefine clippaste
  clippaste () {
        powershell.exe -noprofile -command Get-Clipboard
  }

  alias notebook="jupyter notebook --no-browser"
fi

#detect distro
if [ -f "/etc/arch-release" ]; then
  aur=yay
  alias paci="sudo pacman -S --needed"
  alias pacu="sudo pacman -Syu"
  alias pacs="pacman -Ss"
  alias pac_unlock="sudo rm /var/lib/pacman/db.lck"
  alias pac_cleanup="sudo pacman -Rs $(pacman -Qtdq)"
  alias auru="$aur -Sua"
  alias auri="$aur -S"
  alias aurs="$aur -Ss"
  alias aurl="pacman -Qm"
else
# assume ubuntu based
  alias apti="sudo apt install"
  alias aptud="sudo apt update"
  alias aptug="sudo apt upgrade"
  alias apts="apt search"
  alias apt_cleanup="sudo apt autoremove"
fi
