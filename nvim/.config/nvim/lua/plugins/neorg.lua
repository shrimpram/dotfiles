return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {
            config = {
              icon_preset = "diamond",
              icons = {
                todo = {
                  undone = {
                    icon = " "
                  },
                  done = {
                    icon = "x"
                  },
                  pending = {
                    icon = ""
                  }
                }
              }
            }
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Documents/notes",
                plan = "~/plan"
              },
              default_workspace = "notes"
            }
          },
          ["core.journal"] = {
            config = {
              strategy = "flat",
              workspace = "plan"
            }
          },
          ["core.export"] = {},
        }
      }
    end
  }
}
