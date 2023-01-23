"----------PLUGIN MANAGER
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
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

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
    Plug 'christoomey/vim-tmux-navigator'


    "Candy
    Plug 'ryanoasis/vim-devicons' "Icons for VIM
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
if has('wsl')
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
function Cur()
    lcd %:p:h
endfunction

"----------KEYMAPPINGS----------
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
"go to normal mode
nnoremap s :
"select all
nnoremap<c-a> ggVG
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
"keymap to call the Cur() function
nnoremap<space>z :call Cur()<cr>


colorscheme tokyonight-storm
