"Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"List of plugins
call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete + LSP 
    "Themes
    Plug 'arcticicestudio/nord-vim' 
    Plug 'morhetz/gruvbox'
    Plug 'shinchu/lightline-gruvbox.vim'
    Plug 'joshdick/onedark.vim'
    Plug 'haishanh/night-owl.vim'
    Plug 'arzg/vim-colors-xcode' "light theme

    Plug 'itchyny/lightline.vim' "statusline
    Plug 'preservim/nerdtree' "Sidebar
    Plug 'sheerun/vim-polyglot' "while Treesitter is not here
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} "Multiple cursors
    Plug 'psliwka/vim-smoothie' "Smooth scrolling for Vim done right
    Plug 'numToStr/Comment.nvim' "comment plugin for neovim.
    Plug 'haya14busa/is.vim' "is.vim - incremental search improved
    Plug 'SirVer/ultisnips' "Create new snippets
    Plug 'honza/vim-snippets' "Collection of snippets for various languages
    Plug 'unblevable/quick-scope' "moving horizontally
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "fuzzy file finder
    Plug 'junegunn/fzf.vim'
    Plug 'mhinz/vim-startify' "start screen



    "Candy
    Plug 'ryanoasis/vim-devicons' "Icons for VIM
call plug#end()
