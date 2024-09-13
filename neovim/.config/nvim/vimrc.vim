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


