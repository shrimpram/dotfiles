let os=substitute(system('uname'), '\n', '', '')

let g:vimtex_compiler_method = 'arara'

let g:vimtex_compiler_arara = {
      \ 'options' : ['-lv'],
      \}

if os ==? 'Darwin'
  let g:vimtex_view_general_viewer='open'
elseif os ==? 'Linux'
  let g:vimtex_view_general_viewer='zathura'
endif

set conceallevel=2
