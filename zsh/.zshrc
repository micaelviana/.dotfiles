source $ZDOTDIR/exports.sh
source $ZDOTDIR/plugins.sh
source $ZDOTDIR/functions.sh
source $ZDOTDIR/aliases.sh
source $ZDOTDIR/os.sh

# if which pacman > /dev/null;
# then 
#   source $ZDOTDIR/arch.sh
# else
#   source $ZDOTDIR/ubuntu.sh
# fi

#ZSH OPTIONS
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
#_comp_options+=(globdots)		# Include hidden files.

#SAVE HISTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory


# THEME
ZSH_THEME="spaceship"
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=true
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_CHAR_SYMBOL=">"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_REPO=true

#FZF needs to be the last
source $ZDOTDIR/fzf.sh

### Added by Zinit's installer
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
### End of Zinit's installer chunk

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/micael/.local/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/micael/.local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/micael/.local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/micael/.local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

