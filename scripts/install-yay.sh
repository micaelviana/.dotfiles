#!/usr/bin/env bash

if command -v yay &> /dev/null; then
    echo yay is already installed 
    exit 0
fi

if [ -f "/etc/arch-release" ]; then
    cd tmp || exit 1
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin || exit 1
    makepkg -si
fi
