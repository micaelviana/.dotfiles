# Dotfiles

Create a symbolic links for your files

All
```
ln -s $(pwd)/zshenv/zshenv $HOME/.zshenv && ln -s $(pwd)/zsh $HOME/.config/zsh && ln -s $(pwd)/neovim $HOME/.config/nvim && ln -s $(pwd)/tmux/tmux.conf $HOME/.tmux.conf && ln -s $(pwd)/vim/vimrc $HOME/.vimrc
```

ZSH
```
ln -s $(pwd)/zshenv/zshenv $HOME/.zshenv && ln -s $(pwd)/zsh $HOME/.config/zsh
```

Neovim
```
ln -s $(pwd)/neovim $HOME/.config/nvim
```

Tmux
```
ln -s $(pwd)/tmux/tmux.conf $HOME/.tmux.conf
```

Vim
```
ln -s $(pwd)/vim/vimrc $HOME/.vimrc
```
