vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.foldmethod = "marker"
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.modeline = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.scrolloff = 3
vim.opt.shiftwidth = 2
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.tabstop = 8
vim.opt.termguicolors = true
vim.opt.timeoutlen = 250
vim.opt.title = true
vim.opt.undofile = true
vim.opt.wrap = false

vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])
