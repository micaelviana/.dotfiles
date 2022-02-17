#EXPORTS
export EDITOR=nvim
export VISUAL=code
export SUDO_EDITOR=nvim
export mount="$HOME/Documents/Mountpoint"
export PATH=~/.npm-global/bin:$PATH

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

eval "$(zoxide init zsh)"

[ -f $HOME/.asdf/asdf.sh ]  && . $HOME/.asdf/asdf.sh

#WINDOWS PATH
dir=$(pwd)
windir="/mnt/c/Windows/System32"
if [ $dir = $windir ]; then
    cd $HOME
fi
