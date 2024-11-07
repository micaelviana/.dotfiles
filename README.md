# Dotfiles

## Usage

Clone into your `$HOME` directory

```bash
git clone https://github.com/micaelviana/.dotfiles.git
```

## Ubuntu
Backup packages

```sh
apt list --installed | awk -F'/' '{print $1}' > package_list/wsl-ubuntu.txt

apt list --installed | awk -F'/' '{print $1}' > package_list/desktop-ubuntu.txt

```
Install packages
```sh
xargs -a package_list/wsl-ubuntu.txt sudo apt install

xargs -a package_list/desktop-ubuntu.txt sudo apt install
```


## Arch

Backup packages

```sh
pacman -Qet | awk '{print $1 }' > package_list/wsl-arch.txt

pacman -Qet | awk '{print $1 }' > package_list/desktop-arch.txt
```
Install packages
```sh
yay -S --noconfirm --needed - < package_list/wsl-arch.txt

yay -S --noconfirm --needed - < package_list/desktop-arch.txt
```

 ### AUR Helper
    ```sh
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si
    ```

## Downloads
[Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases/)

[Monaco Nerd Font](https://github.com/Karmenzind/monaco-nerd-fonts)
