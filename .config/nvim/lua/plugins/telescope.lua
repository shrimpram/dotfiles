return {

  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
    keys = {
      {
        "<leader>tb",
        function()
          require("telescope.builtin").buffers({ hidden = true })
        end,
        desc = "Telescope Buffers",
      },
      {
        "<leader>tf",
        function()
          require("telescope.builtin").find_files({ hidden = true })
        end,
        desc = "Telescope Find Files",
      },
      {
        "<leader>tt",
        function()
          require("telescope.builtin").git_files({ hidden = true })
        end,
        desc = "Telescope Git Files",
      },
      {
        "<leader>tr",
        mode = { "n" },
        function()
          require("telescope.builtin").live_grep({ hidden = true })
        end,
        desc = "Telescope Grep",
      },
      {
        "<leader>tr",
        mode = { "x" },
        function()
          require("telescope.builtin").grep_string({ hidden = true })
        end,
        desc = "Telescope Grep",
      },
    },
  },
}
