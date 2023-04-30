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
    Plug 'EdenEast/nightfox.nvim'
    Plug 'arcticicestudio/nord-vim' 
    Plug 'morhetz/gruvbox'
    Plug 'haishanh/night-owl.vim'
    Plug 'arzg/vim-colors-xcode' "light theme

    Plug 'itchyny/lightline.vim' "statusline
    Plug 'ibhagwan/fzf-lua', {'branch': 'main'} "fzf lua
    Plug 'AckslD/nvim-neoclip.lua'
    Plug 'kkharji/sqlite.lua'
    Plug 'preservim/nerdtree' "Sidebar
    Plug 'sheerun/vim-polyglot' "while Treesitter is not here
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} "Multiple cursors
    Plug 'psliwka/vim-smoothie' "Smooth scrolling for Vim done right
    Plug 'numToStr/Comment.nvim' "comment plugin for neovim.
    Plug 'haya14busa/is.vim' "is.vim - incremental search improved
    Plug 'SirVer/ultisnips' "Create new snippets
    Plug 'honza/vim-snippets' "Collection of snippets for various languages
    Plug 'unblevable/quick-scope' "moving horizontally
    Plug 'mhinz/vim-startify' "start screen
    Plug 'christoomey/vim-tmux-navigator'


    "Candy
    Plug 'ryanoasis/vim-devicons' "Icons for VIM
call plug#end()


#some lua  plugins need to be called to work
lua require('Comment').setup()
lua require('neoclip').setup()

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

"----------KEYMAPS----------
"set mapleader
let mapleader = " "
"save and close
nnoremap <silent><leader>w :w <cr>
nnoremap <silent><leader>W :w <cr>
nnoremap <silent><leader>q :q <cr>
nnoremap <silent><leader>z :xa <cr>
nnoremap <silent> \w :w <cr>
nnoremap <silent> \W :w <cr>
nnoremap <silent> \q :q <cr>
nnoremap <silent> \Q :q <cr>
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

colorscheme nordfox
