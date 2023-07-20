return {

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("shreeram.conf.lsp")
    end,
  },

  {
    "glepnir/lspsaga.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
    event = "LspAttach",
    opts = {},
    keys = {
      {
        "K",
        "<cmd>Lspsaga hover_doc<cr>",
        desc = "LSP doc",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "shellcheck",
        "tailwindcss",
        "texlab",
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("shreeram.conf.null-ls")
    end,
  },
}
