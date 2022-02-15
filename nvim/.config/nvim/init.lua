local map = vim.api.nvim_set_keymap

vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

vim.o.autoindent     = true
vim.o.cmdheight      = 1
vim.wo.conceallevel  = 0
vim.o.encoding       = 'UTF-8'
vim.o.foldmethod     = 'marker'
vim.o.foldenable     = false
vim.o.ignorecase     = true
vim.o.smartcase      = true
vim.o.inccommand     = 'nosplit'
vim.o.incsearch      = true
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

vim.cmd([[
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
]])
