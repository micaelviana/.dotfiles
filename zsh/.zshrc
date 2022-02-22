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
setopt auto_cd extendedglob
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
