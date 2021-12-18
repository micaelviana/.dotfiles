## Added by Zinit's installer
if [[ ! -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
    sh -c "$(curl -fsSL https://git.io/zinit-install)"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light spaceship-prompt/spaceship-prompt
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions


#some OHMYZSH tools that are useful
#plugins
zinit snippet OMZP::copyfile
zinit snippet OMZP::copybuffer
zinit snippet OMZP::git
#libraries
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::key-bindings.zsh
### End of Zinit's installer chunk
