#make sure command is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; 
    then sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"; 
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

#Plugins
plugins=(copyfile copybuffer copypath fzf zsh-autosuggestions fast-syntax-highlighting completions zsh-autopair)

#Sources oh-my-zsh config file
source $ZSH/oh-my-zsh.sh

#{{Sources}}
source $HOME/.config/zsh/aliases.sh
source $HOME/.config/zsh/exports.sh
source $HOME/.config/zsh/funcs.sh

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.local/share/dotfiles/zsh/.p10k.zsh.
[[ ! -f ~/.local/share/dotfiles/zsh/.p10k.zsh ]] || source ~/.local/share/dotfiles/zsh/.p10k.zsh
