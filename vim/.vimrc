"-----------PACKAGE MANAGER------------------
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
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
    Plug 'lambdalisue/fern.vim' "tree viewer written in Pure Vim script
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
set nobackup
set nowritebackup
set noswapfile


"---------------AUTOCOMMANDS
"autocmd BufEnter * silent! lcd %:p:h "change directory automaticcaly
"Open images from VIM on Linux
augroup OpenImages
      autocmd BufEnter *.png,*.jpg,*gif exec "! xdg-open ".expand("%" ) | :bw 
augroup END
"Restore cursor shape after leaving Neovim
augroup GuiCursor
      autocmd VimLeave * set guicursor=a:ver30-blinkoff300
augroup END

"-------------------CLIPBOARD, if windows
"detect WSL is harder in VIM than in Neovim, so we use this function
let isWSL=2
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

"------------------------FUNCTIONS
function Current()
    lcd %:p:h
endfunction

"----------KEYMAPS----------
"set mapleader
let mapleader = " "
"save and close
nnoremap <silent><leader>w :w <cr>
nnoremap <silent><leader>W :w <cr>
nnoremap <silent><leader>q :q <cr>
nnoremap <silent><leader>x :xa <cr>
nnoremap <silent> \w :w <cr>
nnoremap <silent> \W :w <cr>
nnoremap <silent> \q :q <cr>
nnoremap <silent> \Q :q <cr>
nnoremap <silent> \z :wqa <cr>
nnoremap <silent> \Z :wqa <cr>
"paste in insert mode using Ctrl+V
inoremap<c-v> <esc>pi
"go to normal mode
nnoremap s :
"select all
nnoremap<c-a> ggVG
"replace selected content faster
" nnoremap <leader>r :%s///g<Left><Left>
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
"keymap to call the Cur() function
nnoremap<space>z :call Cur()<cr>


"{{From plugins}}
colorscheme monokai
"lightline just works in VIM if you put this
set laststatus=2
let g:lightline={'colorscheme':'deus'}
"fzf
nnoremap <c-p> :Files <cr>
"fern
" Custom settings and mappings.
"let g:fern#disable_default_mappings = 1

noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=35<CR><C-w>=

function! FernInit() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> d <Plug>(fern-action-remove)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> h <Plug>(fern-action-hidden-toggle)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> b <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

"vim-mucomplete
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c   " Shut off completion message
set belloff+=ctrlg " Add only if Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

" Select the complete menu item like CTRL+y would.
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
