"----------PLUGIN MANAGER
"Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"List of plugins
call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'} 
    Plug 'numToStr/Comment.nvim'
    Plug 'EdenEast/nightfox.nvim'
    Plug 'bluz71/vim-nightfly-colors', { 'as': 'nightfly' }
    Plug 'sainnhe/sonokai'
    Plug 'rebelot/kanagawa.nvim'
    Plug 'rose-pine/neovim', { 'as': 'rose-pine'}
    Plug 'sainnhe/everforest'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'phaazon/hop.nvim' 
    Plug 'tpope/vim-sensible' 
    Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-pack/nvim-spectre'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-treesitter/nvim-treesitter' 
    Plug 'mg979/vim-visual-multi', {'branch': 'master'} 
    Plug 'psliwka/vim-smoothie' 
    Plug 'tpope/vim-fugitive'
    Plug 'haya14busa/is.vim' 
    Plug 'honza/vim-snippets' 
    Plug 'lambdalisue/suda.vim'
    Plug 'glepnir/dashboard-nvim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'nvim-tree/nvim-web-devicons'
call plug#end()
"----------END (PLUGIN MANAGER)

"---------------AUTOCOMMANDS
"Open images from VIM on Linux
augroup OpenImages
      autocmd BufEnter *.png,*.jpg,*gif exec "! feh ".expand("%" ) | :bwipeout
augroup END
"highlight yank
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch"}

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
"new lines
nnoremap <return> o<esc>
"save and close
nnoremap <silent><leader>w :w <cr>
nnoremap <silent><leader>q :xa <cr>
nnoremap <silent> \w :w <cr>
nnoremap <silent> \q :xa <cr>
nnoremap <silent> \z :xa <cr>
"close without save
nnoremap <silent> Q :qa! <cr>
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

let g:sonokai_style = 'default'
let g:sonokai_better_performance = 1
let g:everforest_better_performance = 1
if !empty($vimcolors)
    colorscheme $vimcolors
else
    colorscheme nordfox
endif


