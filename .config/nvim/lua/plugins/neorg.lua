return {

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    ft = "norg",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neorg/neorg-telescope",
    },
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            default_workspace = "notes",
            workspaces = {
              notes = "~/Documents/10-19_personal/11_notes/",
              media = "~/Documents/10-19_personal/13_media/",
              school = "~/Documents/30-39_school",
              work = "~/Documents/20-29_work",
            },
          },
        },
        ["core.integrations.telescope"] = {},
      },
    },
  },
}
