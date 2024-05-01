#!/usr/bin/env bash

if [ -f "/etc/arch-release" ]; then
    cd tmp
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
fi
