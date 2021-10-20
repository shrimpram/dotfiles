let g:quicktex_math = {
      \' '   : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
      \'*'   : '\cdot',
      \'oo'  : '\infty',
      \'->'  : '\rightarrow',
      \'<-'  : '\leftarrow',
      \'=>'  : '\implies',
      \'<='  : '\impliedby',
      \'^'   : '^{<+++>}<++>',
      \'_'   : '_{<+++>}<++>',
      \'/'   : '\frac{<+++>}{<++>}<++>',
      \'sr'  : '\sqrt{<+++>}<++>',
      \'lim' : '\lim_{<+++>} \to{<++>}<++>',
      \'sum' : '\sum_{<+++> = <++>}^{<++>}',
      \}

let g:quicktex_tex = {
      \' '     : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
      \'em'    : '\emphasize{<+++>}',
      \'it'    : '\textit{<+++>}',
      \'bf'    : '\textbf{<+++>}',
      \'ul'    : '\uline{<+++>}',
      \'sec'   : '\section{<+++>}',
      \'ssec'  : '\subsection{<+++>}',
      \'sssec' : '\subsubsection{<+++>}',
      \'mi'    : '\(<+++>\)<++>',
      \'md'    : "\\[\<CR><+++>\<CR>\\]",
      \'ali'   : "\\begin{align}\<CR><+++>\<CR>\\end{align}",
      \'item'  : "\\begin{itemize}\<CR>\t\\item <+++>\<CR>\\end{itemize}",
      \'enum'  : "\\begin{enumerate}\<CR>\t\\item <+++>\<CR>\\end{enumerate}",
      \'ci'    : '\cite[<+++>]{<++>}<++>',
      \'ca'    : '\autocite[<+++>]{<++>}<++>',
      \'qt'    : '\textquote[{\cite[<+++>]{<++>}}]<++>{<++>}<++>',
      \'qe'    : '\enquote{<+++>}<++>',
      \}

let g:quicktex_asciidoc = {
      \' '  : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
      \'ul' : '[.underline]#<+++>#<++>',
      \'lt' : '[.line-through]#<+++>#<++>',
      \'"'  : '"`<+++>`"<++>',
      \'qt' : "[quote, <+++>, <++>]\<CR>----\<CR><++>\<CR>----",
      \'tb' : ".<+++>\<CR>|===\<CR>|<++>\<CR>|===",
      \}

let g:quicktex_lua = {
      \' '  : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
      \'rq' : "require('<+++>')<++>",
      \'rs' : "require('<+++>').setup{<++>}",
      \}

let g:quicktex_java = {
      \' '   : "\<ESC>:call search('<+.*+>')\<CR>\"_c/+>/e\<CR>",
      \'spr' : 'System.out.print(<+++>);',
      \'spl' : 'System.out.println(<+++>);',
      \}
