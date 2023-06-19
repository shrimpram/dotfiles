return {
  { "junegunn/vim-easy-align", event = "VeryLazy", },
  { "tpope/vim-commentary", event = "VeryLazy", },
  { "wellle/targets.vim", event = "VeryLazy" },
  { "machakann/vim-sandwich", event = "VeryLazy" },
  {
    "romainl/vim-cool",
    config = function()
      vim.cmd([[set hlsearch]])
    end,
    keys = { "/", "?", "*", "#", "g*", "g#", "n", "N" },
  },
  {
    "PeterRincker/vim-searchlight",
    keys = { "/", "?", "*", "#", "g*", "g#", "n", "N" },
  },
  {
    "karb94/neoscroll.nvim",
    config = true,
    event = "VeryLazy",
  },
  { "tpope/vim-speeddating", event = "VeryLazy" },
  { "anuvyklack/hydra.nvim", event = "VeryLazy" },
  {
    "ggandor/leap.nvim",
    dependencies = {
      {
        "tpope/vim-repeat",
        event = "VeryLazy"
      }
    },
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "preservim/vim-pencil"
  },
  {
    "lervag/vimtex",
    ft = "tex",
  }
}
