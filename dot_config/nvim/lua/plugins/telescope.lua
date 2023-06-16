return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
  },
  config = function()
    vim.cmd([[command! Colorscheme Telescope colorscheme]])
    require("telescope").setup({
      extensions = {
        file_browser = {},
        fzf = {},
      },
    })
    require("telescope").load_extension("file_browser")
    require("telescope").load_extension("fzf")
  end,
}
