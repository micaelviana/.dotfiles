# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

setopt SHARE_HISTORY      # Share history between sessions

# Evals
eval "$(zoxide init zsh)"

#Exports
export EDITOR=nvim
export SUDO_EDITOR=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Plugins
plugins=(
    copyfile 
    copybuffer 
    extract
    forgit
    nvm
    fzf 
    fast-syntax-highlighting
    zsh-autosuggestions 
)

#Sources oh-my-zsh config file
source $ZSH/oh-my-zsh.sh

#source my config
source $HOME/.config/zsh/path_rc.sh
source $HOME/.config/zsh/alias_rc.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
