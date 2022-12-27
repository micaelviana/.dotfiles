#EXPORTS
export EDITOR=nvim
export VISUAL=code
export SUDO_EDITOR=nvim

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

eval "$(zoxide init zsh)"

[ -f $HOME/.asdf/asdf.sh ]  && . $HOME/.asdf/asdf.sh

if [ -f "$HOME/.profile" ]; 
then
	source $HOME/.profile
  #eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi
