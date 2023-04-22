# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#{{Plugin Manager}}
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zap-zsh/completions
zinit ice depth=1; zinit light romkatv/powerlevel10k


#some OHMYZSH tools that are useful
#plugins
zinit snippet OMZP::copyfile
zinit snippet OMZP::copybuffer
zinit snippet OMZP::copypath
#libraries
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::key-bindings.zsh
# zinit snippet OMZL::termsupport.zsh
# zinit snippet OMZL::completion.zsh
### End of Zinit's installer chunk


#{{General Options}}
#Case insensitive
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit
#Changing directories without cd, and expand ~
setopt auto_cd 
#setopt auto_cd extendedglob
#Completions
setopt menucomplete
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.

#SAVE HISTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory

#Fix WSL Clipboard
info=$(uname -a)
os="WSL"

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


#{{FZF}}
#FZF needs to be the last to work properly
export FZF_DEFAULT_COMMAND="fd --hidden --follow --exclude '.git' --exclude 'node_modules'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

# source some files to better funcionality
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Directly executing the command (CTRL-X CTRL-R)
fzf-history-widget-accept() {
  fzf-history-widget
  zle accept-line
}
zle     -N     fzf-history-widget-accept
bindkey '^X^R' fzf-history-widget-accept

#{{Sources}}
source $ZDOTDIR/aliases.sh
source $ZDOTDIR/funcs.sh
source $ZDOTDIR/exports.sh


# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
