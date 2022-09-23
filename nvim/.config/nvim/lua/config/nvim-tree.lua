local map = vim.api.nvim_set_keymap
local let = vim.api.nvim_set_var

require('nvim-tree').setup {
  ignore_ft_on_setup = { '.git', '.cache' },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  renderer = {
    indent_markers = {
      enable = true
    },
    add_trailing = true,
    special_files = {
      'README.md', 'Makefile', 'MAKEFILE', 'LICENSE'
    },
  },
}
