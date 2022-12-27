#EXPORTS
export EDITOR=nvim
export VISUAL=code
export SUDO_EDITOR=nvim

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

eval "$(zoxide init zsh)"

[ -f $HOME/.asdf/asdf.sh ]  && . $HOME/.asdf/asdf.sh

if [ grep Ubuntu /etc/os-release &> /dev/null ]; 
then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
