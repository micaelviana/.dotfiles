"----------PLUGIN MANAGER
"Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"List of plugins
call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'} 
    "Themes
    Plug 'EdenEast/nightfox.nvim'
    Plug 'haishanh/night-owl.vim'
    Plug 'folke/tokyonight.nvim'

    Plug 'itchyny/lightline.vim' 
    Plug 'phaazon/hop.nvim' 
    Plug 'tpope/vim-sensible' 
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'preservim/nerdtree' 
    Plug 'nvim-treesitter/nvim-treesitter' 
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} 
    Plug 'psliwka/vim-smoothie' 
    Plug 'tpope/vim-commentary' 
    Plug 'haya14busa/is.vim' 
    Plug 'SirVer/ultisnips' 
    Plug 'honza/vim-snippets' 
    Plug 'mhinz/vim-startify' 
    Plug 'christoomey/vim-tmux-navigator'
    "Candy
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'
call plug#end()
"----------END (PLUGIN MANAGER)

"----------GENERAL----------
set hidden "Keep multiple buffers open
set number relativenumber "Display line numbers
set cursorline "highlit cursor line
set mouse=a "enable mouse interaction
set ignorecase "disable case sensitive in search and commands
set inc=split "command preview
set splitright splitbelow "define which way the splits open
set clipboard+=unnamedplus "Copy/paste between vim and other programs.
"indentation
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

"When and how to draw the signcolumn.
set signcolumn=yes
"Everyone shares this setting
set backspace=indent,eol,start
"Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable 
"delays and poor user experience.
set updatetime=300

set scrolloff=8 "Minimal number of screen lines to keep above and below the cursor.
if has('termguicolors')  "enable terminal colors
    set termguicolors  
endif
" Disable all backup files
set nobackup nowritebackup noswapfile

"---------------AUTOCOMMANDS
"Open images from VIM on Linux
augroup OpenImages
      autocmd BufEnter *.png,*.jpg,*gif exec "! feh ".expand("%" ) | :bwipeout
augroup END
"Restore cursor shape after leaving Neovim
augroup GuiCursor
      autocmd VimLeave * set guicursor=a:ver30-blinkoff300
augroup END


"---------------FUNCTIONS
"command to change the working directory to the directory of the current file
function ChangeCurrentDirectory()
    lcd %:p:h
    pwd
endfunction
nnoremap<space>z :call ChangeCurrentDirectory()  <cr>

"----------KEYMAPS----------
"set mapleader
let mapleader = " "
"save and close
nnoremap <silent><leader>w :w <cr>
nnoremap <silent><leader>W :w <cr>
nnoremap <silent><leader>q :wq <cr>
nnoremap <silent> \w :w <cr>
nnoremap <silent> \W :w <cr>
nnoremap <silent> \q :wq <cr>
nnoremap <silent> \Q :wq <cr>
nnoremap <silent> \z :xa <cr>
nnoremap <silent> \Z :xa <cr>
"paste in insert mode using Ctrl+V
inoremap<c-v> <esc>pa
"go to normal mode
nnoremap s :
vnoremap s :
"select all
nnoremap \a ggVG
"increment/decrement
nnoremap + <c-a>
nnoremap - <c-x>
"replace selected content faster
nnoremap ( :%s///g<Left><Left>
" Map Ctrl-Backspace to delete the previous word in insert mode.
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x
noremap <Del> "_x

"Tip(I always forget)
"Press ^ to go to the first non white space character on the line.
"Press g_ to go to the last non whitespace character in the line.
colorscheme tokyonight-storm
