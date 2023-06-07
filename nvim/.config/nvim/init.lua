vim.g.mapleader      = " "
vim.g.maplocalleader = " "

-- vim options
vim.o.autoindent     = true
vim.o.ignorecase     = true
vim.o.smartcase      = true
vim.o.incsearch      = true
vim.o.backup         = false
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
vim.o.clipboard      = vim.o.clipboard .. "unnamed,unnamedplus"

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", opts)

require("keymaps")

-- vim.cmd([[
-- let g:loaded_gzip              = 1
-- let g:loaded_zip               = 1
-- let g:loaded_zipPlugin         = 1
-- let g:loaded_tar               = 1
-- let g:loaded_tarPlugin         = 1
-- let g:loaded_2html_plugin      = 1
-- let g:loaded_matchit           = 1
-- let g:loaded_tutor_mode_plugin = 1
-- ]])
--
-- vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])
--
-- vim.cmd([[
-- function! ToggleWriteMode()
--   if &textwidth
--     setlocal textwidth=0
--   else
--     setlocal textwidth=72
--   endif
--
--   if &spell
--     setlocal nospell
--   else
--     setlocal spell
--   endif
-- endfunction
--
-- command Write call ToggleWriteMode()
-- ]])
