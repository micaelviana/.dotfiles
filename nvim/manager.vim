"Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

"List of plugins
call plug#begin('~/.vim/plugged')
    "Theme
    Plug 'arcticicestudio/nord-vim'
    Plug 'morhetz/gruvbox' 
    "autopairs
    Plug 'windwp/nvim-autopairs'
    "LSP requirements
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    "LSP extras
    Plug 'williamboman/nvim-lsp-installer' " allows you to seamlessly install LSP servers locally
    Plug 'preservim/nerdtree' "Sidebar
    Plug 'sheerun/vim-polyglot' "while Treesitter is not stable
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} "Multiple cursors
    Plug 'psliwka/vim-smoothie' "Smooth scrolling for Vim done right
    Plug 'nvim-lualine/lualine.nvim' "statusline
    Plug 'preservim/nerdcommenter' "Assistant to insert comments
    Plug 'https://github.com/ctrlpvim/ctrlp.vim' "While telescope is not  here
    Plug 'ryanoasis/vim-devicons' "Icons for VIM
    Plug 'haya14busa/is.vim'
    Plug 'SirVer/ultisnips' "Create new snippets
    "Plug 'honza/vim-snippets' "Collection of snippets for various languages
    Plug 'quangnguyen30192/cmp-nvim-ultisnips'
    "
call plug#end()


