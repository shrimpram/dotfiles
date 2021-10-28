syntax on
filetype plugin on
filetype indent on

"{{{GENERAL SETTINGS
let g:mapleader = ' '
let g:maplocalleader = ' '

"{{{DIRECTORIES
set directory^=~/.local/share/vim/swap
set undodir=~/.local/share/vim/undo
"}}}

set autoindent
set backspace=eol,start,indent
set cmdheight=1
set conceallevel=0
set encoding=UTF-8
set foldmethod=marker foldlevel=0
set hidden
set ignorecase smartcase
set incsearch
set iskeyword+=-
set nobackup
set noerrorbells
set nohlsearch
set nomodeline
set noshowmode
set number relativenumber
set ruler
set scrolloff=3
set tabstop=8 shiftwidth=2 expandtab
set termguicolors
set timeoutlen=250
set title
set undofile
set wrap
set clipboard+=unnamed,unnamedplus
"}}}

"{{{DISABLE DEFAULT VIM PLUGINS
let g:loaded_gzip              = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1

let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1

let g:loaded_2html_plugin      = 1

" let g:loaded_netrw             = 1
" let g:loaded_netrwPlugin       = 1

let g:loaded_matchit           = 1

let g:loaded_tutor_mode_plugin = 1
"}}}

"{{{REMAPS
" Basic leader commands to write and write+quit
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>wq :wq<CR>

" Better indenting
" See https://github.com/ChristianChiarulli/nvim/blob/56f65b12a446fe05483a23585dd4e3104205b062/keys/mappings.vim#L13-L14
vnoremap <silent> < <gv
vnoremap <silent> > >gv

" Make j and k move using visual lines instead of hard lines
nnoremap <expr><silent> j v:count ? 'j' : 'gj'
nnoremap <expr><silent> k v:count ? 'k' : 'gk'
vnoremap <expr><silent> j v:count ? 'j' : 'gj'
vnoremap <expr><silent> k v:count ? 'k' : 'gk'

" Shortcutting split navigation, saving a keypress:
noremap <silent> <C-h> <C-w>h
noremap <silent> <C-j> <C-w>j
noremap <silent> <C-k> <C-w>k
noremap <silent> <C-l> <C-w>l

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
augroup texclean
  autocmd!
  autocmd VimLeave *.tex silent !latexmk -c
augroup END

" Quick way to switch between light and dark mode
command! Light set background=light
command! Dark set background=dark

"}}}

set background=dark
colorscheme desert
