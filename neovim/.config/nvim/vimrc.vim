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

