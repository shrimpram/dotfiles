set autoindent
set nobackup
set clipboard=unnamedplus
set expandtab
set foldmethod=marker
set nohlsearch
set ignorecase
set incsearch
set nomodeline
set number
set relativenumber
set ruler
set scrolloff=3
set shiftwidth=2
set noshowmode
set smartcase
set tabstop=8
set termguicolors
set timeoutlen=250
set title
set undofile
set undodir = "$HOME/.vim/undo"
set nowrap

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
