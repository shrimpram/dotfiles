function! ToggleWriteMode()
  if &textwidth
    setlocal textwidth=0
  else
    setlocal textwidth=72
  endif

  if &spell
    setlocal nospell
  else
    setlocal spell
  endif
endfunction

command Write call ToggleWriteMode()

let os=substitute(system('uname'), '\n', '', '')

let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-lualatex',
    \}

if os ==? 'Darwin'
  let g:vimtex_view_general_viewer='open'
elseif os ==? 'Linux'
  let g:vimtex_view_general_viewer='zathura'
endif
