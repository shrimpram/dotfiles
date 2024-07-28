syntax on
filetype plugin indent on

let mapleader = " "
let maplocalleader = " "

" Don't try to be vi compatible
set nocompatible

" Enable backspace
set backspace=indent,eol,start

" Display line numbers
set number
set relativenumber

" Tab and indent settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Search settings
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Persistent undo
set undofile
set undodir = "$HOME/.vim/undo"
set updatetime=500

" Wrapping and display settings
set nowrap
set ruler
set scrolloff=3
set title
set wildmenu
set showcmd

" Disable modeline for security
set nomodeline

" Enable true color support
set termguicolors

" Write settings
set nobackup

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

" KEYBINDINGS

" Indent left and right in visual mode, keeping the selection
vnoremap < <gv
vnoremap > >gv

" Move down and up, accounting for line wrapping
nnoremap <expr> j v:count ? 'j' : 'gj'
xnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
xnoremap <expr> k v:count ? 'k' : 'gk'

" Write buffer commands
nnoremap <Leader>w <CMD>write<CR>
nnoremap <Leader>ww <CMD>write<CR>
nnoremap <Leader>wq <CMD>wq<CR>

" Quickfix list commands
nnoremap <leader>co <CMD>copen<CR>
nnoremap <leader>cn <CMD>cnext<CR>
nnoremap <leader>cp <CMD>cprev<CR>

" Correct spelling error in insert mode
inoremap <C-l> <C-G>u<Esc>[s1z=`]a<C-G>u

" Paste without overwriting the register in visual mode
xnoremap <leader>p "_dP

" Yank to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y <CMD>%y +<CR>

" Delete without overwriting the register
nnoremap <leader>d "_d
vnoremap <leader>d "_d

set background=dark
