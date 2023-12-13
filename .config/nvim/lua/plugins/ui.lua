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
    opts = {
      performance_mode = true,
    },
  },

  {
    "PeterRincker/vim-searchlight",
    keys = { "/", "?", "*", "#", "g*", "g#", "n", "N" },
  },

  {
    "shrimpram/stella",
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/vim")
      vim.cmd("colorscheme stella-dark")
    end,
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
