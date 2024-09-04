function GitAddFile()
    Git add %
    echo "Added file"
endfunction
nnoremap <silent><space>ga :call GitAddFile()<cr>
nnoremap <silent><space>gc :Git commit<cr>
