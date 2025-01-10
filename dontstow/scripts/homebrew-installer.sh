#!/usr/bin/env bash

# Detect Linux distribution and version
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
else
    OS=$(uname -s)
    VER=$(uname -r)
fi

echo "Detected: $OS $VER"

# Install dependencies
if [[ "$OS" == "ubuntu" || "$OS" == "debian" ]]; then
    sudo apt update
    sudo apt install -y procps build-essential curl file git
elif [[ "$OS" == "fedora" ]]; then
    sudo dnf groupinstall -y "Development Tools"
    sudo dnf install -y curl file git procps-ng
elif [[ "$OS" == "centos" ]]; then
    sudo yum groupinstall -y "Development Tools"
    sudo yum install -y curl file git procps-ng
elif [[ "$OS" == "arch" ]]; then
    sudo pacman -Syu --noconfirm base-devel curl file git procps-ng
else
    echo "Unsupported distribution"
    exit 1
fi

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
