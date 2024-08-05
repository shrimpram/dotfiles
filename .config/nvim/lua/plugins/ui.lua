return {

  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufEnter", "BufReadPre" },
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },

  {
    "romainl/vim-cool",
    config = function()
      vim.cmd([[set hlsearch]])
    end,
    keys = { "/", "?", "*", "#", "g*", "g#", "n", "N" },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("shreeram.conf.lualine")
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {},
    cond = function()
      return not vim.g.neovide
    end,
  },

  {
    "PeterRincker/vim-searchlight",
    keys = { "/", "?", "*", "#", "g*", "g#", "n", "N" },
  },

  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
          styles = {
            comments = "italic",
          },
          inverse = {
            visual = false,
          },
          modules = {
            cmp = { enable = true },
            dapui = { enable = true },
            gitsigns = { enable = true },
            native_lsp = { enable = true },
            neogit = { enable = true },
            treesitter = { enable = true },
            whichkey = { enable = true },
          },
        },
      })
      vim.cmd("colorscheme github_dark_default")
    end,
  },

  {
    "mrjones2014/smart-splits.nvim",
    opts = {},
    keys = {
      {
        "<M-k>",
        function()
          require("smart-splits").resize_up()
        end,
      },
      {
        "<M-j>",
        function()
          require("smart-splits").resize_down()
        end,
      },
      {
        "<M-h>",
        function()
          require("smart-splits").resize_left()
        end,
      },
      {
        "<M-l>",
        function()
          require("smart-splits").resize_right()
        end,
      },

      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
      },
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
      },

      {
        "<C-w>K",
        function()
          require("smart-splits").swap_buf_up({ move_cursor = true })
        end,
      },
      {
        "<C-w>J",
        function()
          require("smart-splits").swap_buf_down({ move_cursor = true })
        end,
      },
      {
        "<C-w>H",
        function()
          require("smart-splits").swap_buf_left({ move_cursor = true })
        end,
      },
      {
        "<C-w>L",
        function()
          require("smart-splits").swap_buf_right({ move_cursor = true })
        end,
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
