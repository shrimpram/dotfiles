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
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, {"i", "s"}),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, {"i", "s"}),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets/"})

      require("luasnip").config.set_config({
        enable_autosnippets = true,
        store_selection_keys = "<Tab>",
      })
    end,
  }
}
