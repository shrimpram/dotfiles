return {

  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },

  {
    "andymass/vim-matchup",
  },

  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    config = true,
  },

  {
    "machakann/vim-sandwich",
    init = function()
      vim.cmd([[let g:sandwich_no_default_key_mappings = 1]])
    end,
    config = function()
      vim.cmd([[runtime macros/sandwich/keymap/surround.vim]])
    end,
  },

  "tpope/vim-speeddating",

  "wellle/targets.vim",

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
}
