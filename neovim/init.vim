"----------PLUGIN MANAGER
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'rose-pine/neovim', {'as': 'rose-pine'}

<<<<<<< HEAD
    Plug 'itchyny/lightline.vim' 
    Plug 'windwp/nvim-autopairs' 
    Plug 'ibhagwan/fzf-lua', {'branch': 'main'} 
    Plug 'tpope/vim-sensible' 
    Plug 'preservim/nerdtree' 
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} 
    Plug 'psliwka/vim-smoothie' 
    Plug 'tpope/vim-commentary' 
    Plug 'haya14busa/is.vim' 
    Plug 'SirVer/ultisnips'  
    Plug 'honza/vim-snippets' 
    Plug 'unblevable/quick-scope' 
    Plug 'mhinz/vim-startify' 
=======
    Plug 'itchyny/lightline.vim' "statusline
    Plug 'LunarWatcher/auto-pairs' "autopairs
    Plug 'ibhagwan/fzf-lua', {'branch': 'main'} "fzf lua
    Plug 'tpope/vim-sensible' "tpope
    Plug 'preservim/nerdtree' "Sidebar
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "treesitter
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} "Multiple cursors
    Plug 'psliwka/vim-smoothie' "Smooth scrolling for Vim done right
    Plug 'tpope/vim-commentary' "Comment stuff out
    Plug 'haya14busa/is.vim' "is.vim - incremental search improved
    Plug 'SirVer/ultisnips' "Create new snippets
    Plug 'honza/vim-snippets' "Collection of snippets for various languages
    Plug 'unblevable/quick-scope' "moving horizontally
    Plug 'mhinz/vim-startify' "start screen
>>>>>>> parent of 1903508 (nvim - add plugin - nvim-autopairs)
    Plug 'christoomey/vim-tmux-navigator'
    "Candy
    Plug 'nvim-tree/nvim-web-devicons' | Plug 'ryanoasis/vim-devicons' 
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
" highlighting a selection on yank
 au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=40}

"----------------Functions
function TurnLight () 
    colorscheme rose-pine-dawn
    set background=light
endfunction

"-------------------CLIPBOARD, if WSL
if has('wsl')
    let g:clipboard = {
    \   'name': 'WslClipboard',
    \   'copy': {
    \      '+': 'clip.exe',
    \      '*': 'clip.exe',
    \    },
    \   'paste': {
    \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    \   },
    \   'cache_enabled': 0,
    \ }
endif


"----------KEYMAPS----------
"set mapleader
let mapleader = " "
"save and close
nnoremap <silent><leader>w :w <cr>
nnoremap <silent><leader>W :w <cr>
<<<<<<< HEAD
nnoremap <silent><leader>q :wq <cr>
<<<<<<< HEAD
nnoremap <silent><leader>Q :wq <cr>
=======
nnoremap <silent><leader>q :q <cr>
nnoremap <silent><leader>z :xa <cr>
>>>>>>> parent of 2122794 (nvim - change theme - rose-pine-moon)
=======
>>>>>>> parent of 1903508 (nvim - add plugin - nvim-autopairs)
nnoremap <silent> \w :w <cr>
nnoremap <silent> \W :w <cr>
nnoremap <silent> \q :q <cr>
nnoremap <silent> \Q :q <cr>
nnoremap <silent> \z :xa <cr>
nnoremap <silent> \Z :xa <cr>
"paste in insert mode using Ctrl+V
" inoremap<c-v> <esc>pa
"go to normal mode
nnoremap s :
vnoremap s :
"select all
nnoremap \a ggVG
"increment/decrement
nnoremap + <c-a>
nnoremap - <c-x>
"replace selected content faster
nnoremap _ :%s///g<Left><Left>
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
"command to change the working directory to the directory of the current file
command! Current lcd %:p:h 
nnoremap<space>z :Current <cr>

<<<<<<< HEAD
<<<<<<< HEAD
colorscheme tokyonight
=======
colorscheme rose-pine
>>>>>>> parent of 2122794 (nvim - change theme - rose-pine-moon)
=======
colorscheme catppuccin-macchiato
>>>>>>> parent of 41f421a (nvim - add theme - tokyonight)
