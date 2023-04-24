#make sure command is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; 
    then sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"; 
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

#Plugins
plugins=(copyfile copybuffer copypath zsh-autosuggestions fast-syntax-highlighting completions zsh-autopair)

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
fi

source $ZSH/oh-my-zsh.sh

#{{Sources}}
source $HOME/.config/zsh/aliases.sh
source $HOME/.config/zsh/exports.sh
source $HOME/.config/zsh/funcs.sh
