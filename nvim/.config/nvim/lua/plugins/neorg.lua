return {

  -- {
  --   "nvim-neorg/neorg",
  --   -- build = ":Neorg sync-parsers",
  --   ft = "norg",
  --   event = "VeryLazy",
  --   config = true,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-neorg/neorg-telescope",
  --     {
  --       "vhyrro/luarocks.nvim",
  --       priority = 1000,
  --       config = true,
  --     },
  --   },
  --   init = function()
  --     require("shreeram.conf.norg")
  --   end,
  --   opts = {
  --     load = {
  --       ["core.defaults"] = {}, -- Loads default behaviour
  --       ["core.concealer"] = {}, -- Adds pretty icons to your documents
  --       ["core.dirman"] = { -- Manages Neorg workspaces
  --         config = {
  --           default_workspace = "notes",
  --           workspaces = {
  --             notes = "~/Documents/notes/",
  --             media = "~/Documents/media/",
  --           },
  --         },
  --       },
  --       ["core.integrations.telescope"] = {},
  --     },
  --   },
  -- },
}
