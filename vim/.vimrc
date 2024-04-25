"-----------PACKAGE MANAGER------------------
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
"    Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocomplete + LSP 
    "Themes
    Plug 'arcticicestudio/nord-vim' 
    Plug 'crusoexia/vim-monokai'
    Plug 'itchyny/lightline.vim' "statusline
    "Autocomplete
    Plug 'lifepillar/vim-mucomplete'
    "Utilities
    Plug 'sheerun/vim-polyglot' "while Treesitter is not here
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} "Multiple cursors
    Plug 'psliwka/vim-smoothie' "Smooth scrolling for Vim done right
    Plug 'haya14busa/is.vim' "is.vim - incremental search improved
    Plug 'christoomey/vim-tmux-navigator'
    "fuzzy file finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-commentary' "commentary.vim: comment stuff out

call plug#end()
"----------GENERAL----------
syntax enable
filetype on
filetype plugin on
set incsearch
set nocompatible
set hidden "Keep multiple buffers open
set number relativenumber "Display line numbers
set cursorline "highlit cursor line
set mouse=a "enable mouse interaction
set ignorecase "disable case sensitive in search and commands
if has('nvim')
    set inc=split "command preview
endif
set splitright splitbelow "define which way the splits open
if has('clipboard')
    set clipboard=unnamedplus "Copy/paste between vim and other programs.
endif
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
"autocmd BufEnter * silent! lcd %:p:h "change directory automaticcaly
"Open images from VIM on Linux
augroup OpenImages
      autocmd BufEnter *.png,*.jpg,*gif exec "! feh ".expand("%" ) | :bwipeout
augroup END
"highlight yank
if has('nvim')
    au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=40}
endif
"---------------COMMANDS
"remove M^ characters
command WindowsCleaning %s/\r/

"---------------FUNCTIONS
"command to change the working directory to the directory of the current file
function ChangeCurrentDirectory()
    lcd %:p:h
    pwd
endfunction
nnoremap<space>z :call ChangeCurrentDirectory()  <cr>

"-------------------CLIPBOARD, if windows
"detect WSL is harder in VIM than in Neovim, so we use this function
let isWSL=0
let uname = substitute(system('uname'),'\n','','')
if uname == 'Linux'
    let lines = readfile("/proc/version")
    if lines[0] =~ "Microsoft"
        let isWSL = 1
    else
        let isWSL = 0
    endif
endif

if isWSL == 1
      let g:clipboard = {
            \   'name': 'win32yank-wsl',
            \   'copy': {
            \      '+': '/usr/local/bin/win32yank.exe -i --crlf',
            \      '*': '/usr/local/bin/win32yank.exe -i --crlf',
            \    },
            \   'paste': {
            \      '+': '/usr/local/bin/win32yank.exe -o --lf',
            \      '*': '/usr/local/bin/win32yank.exe -o --lf',
            \   },
            \   'cache_enabled': 0,
            \ }
endif

"----------KEYMAPS----------
"set mapleader
let mapleader = " "
"new lines
nnoremap <return> o<esc>
"save and close
nnoremap <silent><leader>w :w <cr>
nnoremap <silent><leader>q :xa <cr>
nnoremap <silent> \w :w <cr>
nnoremap <silent> \q :xa <cr>
nnoremap <silent> \z :xa <cr>
"make executable
nnoremap <silent><space>x :!chmod +x %<cr>
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

"{{From plugins}}
"lightline just works in VIM if you put this
set laststatus=2
let g:lightline={'colorscheme':'nord'}
"fzf
nnoremap <c-p> :Files <cr>
nnoremap tf :Files <cr>
"vim-mucomplete
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c   " Shut off completion message
set belloff+=ctrlg " Add only if Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

" Select the complete menu item like CTRL+y would.
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
colorscheme nord
