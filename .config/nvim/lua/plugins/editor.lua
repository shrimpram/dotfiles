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
    "echasnovski/mini.comment",
    dependencies = {
      { "joosepalviste/nvim-ts-context-commentstring", lazy = true },
    },
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
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
}
