# Dotfiles

Create a symbolic links for your files

All
```
ln -s $(pwd)/.zshenv $HOME/.zshenv && ln -s $(pwd)/zsh $HOME/.config/zsh && ln -s $(pwd)/nvim $HOME/.config/nvim && ln -s $(pwd)/tmux/.tmux.conf $HOME/.tmux.conf
```

ZSH
```
ln -s $(pwd)/.zshenv $HOME/.zshenv && ln -s $(pwd)/zsh $HOME/.config/zsh
```

Neovim
```
ln -s $(pwd)/nvim $HOME/.config/nvim
```

Tmux
```
ln -s $(pwd)/tmux/.tmux.conf $HOME/.tmux.conf
```
