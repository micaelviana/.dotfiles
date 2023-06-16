let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   MRU']            },
          \ ]

let g:startify_custom_header = [     
	\ '                                       ',
	\ '    ░█▀▄░▄▀▀▄░▀█▀░█▀▀░░▀░░█░░█▀▀░█▀▀   ', 
	\ '    ░█░█░█░░█░░█░░█▀░░░█▀░█░░█▀▀░▀▀▄   ',
	\ '    ░▀▀░░░▀▀░░░▀░░▀░░░▀▀▀░▀▀░▀▀▀░▀▀▀   ']

nnoremap <c-s> :Startify <cr>
