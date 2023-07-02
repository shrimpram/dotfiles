local hydra = require("hydra")
local hydra_cmd = require("hydra.keymap-util").cmd
local gitsigns = require("gitsigns")

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
