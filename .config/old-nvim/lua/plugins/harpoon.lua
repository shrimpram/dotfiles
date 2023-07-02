return {
  "ThePrimeagen/harpoon",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>hz", mark.add_file)
    vim.keymap.set("n", "<leader>hx", ui.nav_next)
    vim.keymap.set("n", "<leader>hc", ui.nav_prev)
    vim.keymap.set("n", "<leader>hv", ui.toggle_quick_menu)

    vim.keymap.set("n", "<leader>ha", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<leader>hr", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<leader>hs", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<leader>ht", function() ui.nav_file(4) end)
  end,
  dependencies = {"nvim-lua/plenary.nvim"}
}
