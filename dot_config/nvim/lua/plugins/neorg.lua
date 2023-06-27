return {
  {
    "nvim-neorg/neorg",
    ft = "norg",
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
          ["core.export"] = {},
        }
      }
    end
  }
}
