return {

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              media = "~/Documents/10-19 personal/13 media/",
              school = "~/Documents/30-39 school",
              work = "~/Documents/20-29 work",
            },
          },
        },
      },
    },
  },
}
