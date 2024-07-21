return {

  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    dependencies = "neovim/nvim-lspconfig",
  },

  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

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
    opts = {
      lightbulb = {
        enable = false,
      },
    },
    keys = {
      {
        "gk",
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
        "<leader>ld",
        "<cmd>Lspsaga goto_definition<cr>",
        desc = "Lspsaga goto definition",
      },
      {
        "<leader>le",
        "<cmd>Lspsaga show_line_diagnostics<cr>",
        desc = "Lspsaga show line diagnostics",
      },
      {
        "<leader>lo",
        "<cmd>Lspsaga outline<cr>",
        desc = "Lspsaga toggle outline",
      },
      {
        "<leader>lr",
        "<cmd>Lspsaga rename<cr>",
        desc = "Lspsaga rename",
      },
      {
        "<leader>lt",
        "<cmd>Lspsaga term_toggle<cr>",
        desc = "Lspsaga toggle terminal",
      },
      {
        "<leader>lw",
        "<cmd>Lspsaga show_workspace_diagnostics<cr>",
        desc = "Lspsaga show workspace diagnostics",
      },
      {
        "]d",
        "<cmd>Lspsaga diagnostic_jump_next<cr>",
        desc = "Lspsaga jump to next diagnostic",
      },
      {
        "[d",
        "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        desc = "Lspsaga jump to previous diagnostic",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
  },

  {
    "nvimdev/guard.nvim",
    -- Builtin configuration, optional
    dependencies = {
      "nvimdev/guard-collection",
    },
    config = function()
      require("shreeram.conf.guard")
    end,
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
