let os=substitute(system('uname'), '\n', '', '')

let g:vimtex_compiler_arara = {
      \ 'options' : ['--log'],
      \}

if os ==? 'Darwin'
  let g:vimtex_view_general_viewer='open'
elseif os ==? 'Linux'
  let g:vimtex_view_general_viewer='zathura'
endif

set conceallevel=0
