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
set nobackup
set nowritebackup
set noswapfile

"Config to vim lsp - highlight document
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

"---------------AUTOCOMMANDS
"autocmd BufEnter * silent! lcd %:p:h "change directory automaticcaly
autocmd BufEnter *.png,*.jpg,*gif exec "! xdg-open ".expand("%" ) | :bw "Open images from VIM on Linux


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
"select all
nnoremap<c-a> ggVG
"reload Vim File 
nnoremap <leader>rv :source % <cr>
"edit  vim file in a new tab
nnoremap <silent><leader>ev :tabnew $MYVIMRC <cr>
"shortcut for switch between modes faster
" imap jj <Esc>
" imap JJ <Esc>
"replace selected content faster
nnoremap <leader>r :%s///g<Left><Left>
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


"Better split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"---------------Imports
runtime ./manager.vim

colorscheme nord
