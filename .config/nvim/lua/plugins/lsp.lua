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
        desc = "Lspsaga doc",
      },
      {
        "<leader>la",
        "<cmd>Lspsaga code_action<cr>",
        desc = "Lspsaga code action",
      },
      {
        "<leader>lf",
        "<cmd>Lspsaga finder<cr>",
        desc = "Lspsaga finder",
      },
      {
        "<leader>lr",
        "<cmd>Lspsaga rename<cr>",
        desc = "Lspsaga rename",
      },
      {
        "<leader>lg",
        "<cmd>Lspsaga goto_definition<cr>",
        desc = "Lspsaga goto definition",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "prettier",
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
