#Common aliases
alias vi=nvim
alias zshr="source ~/.zshrc"
alias py=python3
alias open=xdg-open
#lsd aliases
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'

alias si="__zoxide_zi"

alias gcom="git commit -m"
#Platform exclusive
aur=yay
if which pacman > /dev/null;then
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
  alias install="sudo apt install"
  alias update="sudo apt update"
  alias upgrade="sudo apt upgrade"
  alias search="apt search"
  alias cleanup="sudo apt autoremove"
fi
