let $FZF_DEFAULT_COMMAND='find . \! \( -type d -path ./.git -prune \) \! -type d \! -name ''*.tags'' -printf ''%P\n'''
nmap <c-p> :Files <cr>
nmap <c-f> :Rg <cr>
nmap <space>h :History <cr>
nmap <space>b :Buffers <cr>
