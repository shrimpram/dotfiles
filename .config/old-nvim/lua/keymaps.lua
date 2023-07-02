local hydra = require("hydra")
local hydra_cmd = require("hydra.keymap-util").cmd
local gitsigns = require("gitsigns")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set({"n", "v"}, "j", [[v:count ? "j" : "gj"]], {expr = true})
vim.keymap.set({"n", "v"}, "k", [[v:count ? "k" : "gk"]], {expr = true})

vim.keymap.set("n", "<Leader>w", vim.cmd.write, {desc = "Write buffer"})
vim.keymap.set("n", "<Leader>ww", vim.cmd.write, {desc = "Write buffer"})
vim.keymap.set("n", "<Leader>wq", vim.cmd.wq, {desc = "Write buffer and quit"})

vim.keymap.set({"n", "x"}, "<C-l>", "<C-w>l", {desc = "Move to right split"})
vim.keymap.set({"n", "x"}, "<C-h>", "<C-w>h", {desc = "Move to left split"})
vim.keymap.set({"n", "x"}, "<C-j>", "<C-w>j", {desc = "Move to below split"})
vim.keymap.set({"n", "x"}, "<C-k>", "<C-w>k", {desc = "Move to above split"})

-- TODO Use v:count for counted remappings
local resize = require("utils").resize
vim.keymap.set({"n", "x"}, "<M-j>", function() resize(false, 3) end)
vim.keymap.set({"n", "x"}, "<M-k>", function() resize(false, -3) end)
vim.keymap.set({"n", "x"}, "<M-l>", function() resize(true, 3) end)
vim.keymap.set({"n", "x"}, "<M-h>", function() resize(true, -3) end)

vim.keymap.set({"n", "x", "o"}, "gl", "<Plug>(EasyAlign)")

vim.keymap.set("n", "<leader>co", vim.cmd.copen)
vim.keymap.set("n", "<leader>cn", vim.cmd.cnext)
vim.keymap.set("n", "<leader>cp", vim.cmd.cprev)

vim.cmd([[
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]])

local telescope_hint = [[
_f_: find files    _g_: git files
_l_: grep folder   _z_: grep buffer
_b_: buffers       _t_: file browser

---LSP---

_d_: definitions  _r_: references

_<CR>_: Telescope  _<Esc>_: Exit
]]

hydra({
  name = "Telescope",
  hint = telescope_hint,
  config = {
    color = "blue",
    invoke_on_body = true,
    hint = {
      position = "bottom-left",
      border = "rounded",
    }
  },
  mode = "n",
  body = "<Leader>t",
  heads = {
    { "f", hydra_cmd("Telescope find_files"), {desc = "Find Files"}},
    { "g", hydra_cmd("Telescope git_files"), {desc = "Git Files"}},
    { "t", hydra_cmd("Telescope file_browser"), {desc = "File Browser"}},
    { "l", hydra_cmd("Telescope live_grep"), {desc = "Grep Folder"}},
    { "z", hydra_cmd("Telescope current_buffer_fuzzy_find"), {desc = "Grep Buffer"}},
    { "b", hydra_cmd("Telescope buffers"), {desc = "List Buffers"}},
    { "d", hydra_cmd("Telescope lsp_definitions"), {desc = "LSP Definitions"}},
    { "r", hydra_cmd("Telescope lsp_references"), {desc = "LSP References"}},
    { "<CR>", hydra_cmd("Telescope"), { exit = true, desc = "Telescope" }},
    { "<Esc>", nil, { exit = true, nowait = true }},
  }
})


local git_hint = [[
_b_: blame line        _B_: blame line full
_n_: next hunk         _p_: prev hunk
_r_: reset hunk        _R_: reset buffer
_s_: stage hunk        _S_: stage buffer
_u_: undo stage hunk   _v_: preview hunk

_<CR>_: Neogit         _<Esc>_: exit
]]

hydra({
  name = "Git",
  hint = git_hint,
  config = {
    color = "blue",
    invoke_on_body = true,
    hint = {
      type = "window",
      position = "bottom-left",
      border = "rounded",
    }
  },
  mode = {"n", "v"},
  body = "<Leader>g",
  heads = {
    { "n", gitsigns.next_hunk, {desc = "Next Hunk"}},
    { "p", gitsigns.prev_hunk, {desc = "Prev Hunk"}},
    { "b", gitsigns.blame_line, {desc = "Blame Line"}},
    { "B", function() gitsigns.blame_line{full = true} end, {desc = "Blame Line Full"}},
    { "v", gitsigns.preview_hunk, {desc = "Preview Hunk"}},
    { "s", gitsigns.stage_hunk, {desc = "Stage Hunk"}},
    { "S", gitsigns.stage_buffer, {desc = "Stage Buffer"}},
    { "u", gitsigns.undo_stage_hunk, {desc = "Undo Stage Hunk"}},
    { "r", gitsigns.reset_hunk, {desc = "Reset Hunk"}},
    { "R", gitsigns.reset_buffer, {desc = "Reset Buffer"}},
    { "<CR>", hydra_cmd("Neogit"), { exit = true, desc = "Neogit" } },
    { "<Esc>", nil, { exit = true, nowait = true }},
  }
})
