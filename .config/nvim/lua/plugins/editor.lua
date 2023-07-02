return {

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        char = { enabled = false },
        search = { enabled = false }
      }
    },
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Flash Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },
  },

  {
    "ggandor/leap.nvim",
    dependencies = {"tpope/vim-repeat"},
    config = function()
      require("leap").add_default_mappings()
    end,
  },

  {
    "echasnovski/mini.align",
    event = "VeryLazy",
    config = true,
  },

  {
    "echasnovski/mini.comment",
    dependencies = {
      {"joosepalviste/nvim-ts-context-commentstring", lazy = true}
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

  "machakann/vim-sandwich",

  "tpope/vim-speeddating",

  "wellle/targets.vim",
}
