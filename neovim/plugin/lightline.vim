let g:lightline = {
	\ 'colorscheme': 'rosepine',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }
  
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
