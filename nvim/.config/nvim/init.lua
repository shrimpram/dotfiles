local map = vim.api.nvim_set_keymap

vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

vim.o.autoindent     = true
vim.o.cmdheight      = 1
vim.wo.conceallevel  = 0
vim.o.encoding       = 'UTF-8'
vim.o.foldmethod     = 'marker'
vim.o.foldlevel      = 0
vim.o.hidden         = true
vim.o.ignorecase     = true
vim.o.smartcase      = true
vim.o.inccommand     = 'nosplit'
vim.o.incsearch      = true
---vim.o.iskeyword   = vim.o.iskeyword .. '-'
vim.o.backup         = false
vim.o.errorbells     = false
vim.o.hlsearch       = false
vim.o.modeline       = false
vim.o.showmode       = false
vim.o.number         = true
vim.o.relativenumber = true
vim.o.ruler          = true
vim.o.scrolloff      = 3
vim.o.tabstop        = 8
vim.o.shiftwidth     = 2
vim.o.expandtab      = true
vim.o.termguicolors  = true
vim.o.timeoutlen     = 250
vim.o.title          = true
vim.o.undofile       = true
vim.o.wrap           = true
vim.o.clipboard      = vim.o.clipboard .. 'unnamed,unnamedplus'
vim.cmd([[colorscheme stella]])

require('plugins')

require('utils')

vim.cmd([[
let g:loaded_gzip              = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_2html_plugin      = 1
let g:loaded_matchit           = 1
let g:loaded_tutor_mode_plugin = 1
]])

vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])



map( 'n', 'w', '<CMD>w<CR>', {noremap=true, silent=true} )
map( 'n', 'wq', '<CMD>wq<CR>', {noremap=true, silent=true} )

map( 'v', '<', '<gv', {noremap=true, silent=true} )
map( 'v', '>', '>gv', {noremap=true, silent=true} )

map( 'n', 'j', [[v:count ? 'j' : 'gj']], {noremap=true, silent=true, expr=true} )
map( 'n', 'k', [[v:count ? 'k' : 'gk']], {noremap=true, silent=true, expr=true} )
map( 'v', 'j', [[v:count ? 'j' : 'gj']], {noremap=true, silent=true, expr=true} )
map( 'v', 'k', [[v:count ? 'k' : 'gk']], {noremap=true, silent=true, expr=true} )

map( 'n', '<M-j>', [[<cmd>lua require('utils').resize(false, 2)<CR>]], {noremap=true, silent=true} )
map( 'n', '<M-k>', [[<cmd>lua require('utils').resize(false, -2)<CR>]], {noremap=true, silent=true} )
map( 'n', '<M-l>', [[<cmd>lua require('utils').resize(true, 2)<CR>]], {noremap=true, silent=true} )
map( 'n', '<M-h>', [[<cmd>lua require('utils').resize(true, -2)<CR>]], {noremap=true, silent=true} )

map( 'n', '<C-h>', '<C-w>h', {noremap=true, silent=true} )
map( 'n', '<C-j>', '<C-w>j', {noremap=true, silent=true} )
map( 'n', '<C-k>', '<C-w>k', {noremap=true, silent=true} )
map( 'n', '<C-l>', '<C-w>l', {noremap=true, silent=true} )
