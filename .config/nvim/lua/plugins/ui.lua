return {

  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufEnter", "BufReadPre" },
    opts = {
      user_default_options = {
        tailwind = true,
      }
    }
  },

  {
    "romainl/vim-cool",
    config = function()
      vim.cmd([[set hlsearch]])
    end,
    keys = {"/", "?", "*", "#", "g*", "g#", "n", "N"},
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    version = "2.20.7",
    opts = {
      filetype_exclude = {
        "Trouble",
        "alpha",
        "dashboard",
        "harpoon",
        "help",
        "lazy",
        "lazyterm",
        "mason",
        "neo-tree",
        "notify",
        "toggleterm",
      },
      show_current_context = true,
    },
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
    config = true,
  },

  {
    "PeterRincker/vim-searchlight",
    keys = {"/", "?", "*", "#", "g*", "g#", "n", "N"},
  },

  {
    "shrimpram/stella",
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/vim")
      vim.cmd("colorscheme stella-dark")
    end
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
    }
  }

}
