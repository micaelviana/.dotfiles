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
  alias install="sudo pacman -S --needed"
  alias upgrade="sudo pacman -Syu"
  alias update="upgrade"
  alias search="pacman -Ss"
  alias unlock="sudo rm /var/lib/pacman/db.lck"
  alias cleanup="sudo pacman -Rs $(pacman -Qtdq)"
  alias aurup="$aur -Sua"
  alias aurin="$aur -S"
  alias aurse="$aur -Ss"
  alias aurl="pacman -Qm"
else
# assume ubuntu based
  alias install="sudo apt install"
  alias update="sudo apt update"
  alias upgrade="sudo apt upgrade"
  alias search="apt search"
  alias cleanup="sudo apt autoremove"
fi
