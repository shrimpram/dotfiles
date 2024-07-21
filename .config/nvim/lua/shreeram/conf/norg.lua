local neorg_callbacks = require("neorg.core.callbacks")

-- TODO the third table starting on l:19 is the third part of the keybinding specification,
-- meaning that any description passed in the definition within the
-- keybinds.map_event_to_mode function don't actually have the description field available to them

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
  -- Map all the below keybinds only when the "norg" mode is active
  keybinds.map_event_to_mode("norg", {
    n = { -- Bind keys in normal mode
      { "<leader>nf", "core.integrations.telescope.find_norg_files" },
      { "<leader>nt", "core.integrations.telescope.find_linkable" },
      { "<leader>nh", "core.integrations.telescope.search_headings" },
      { "<leader>nit", "core.integrations.telescope.insert_link" },
      { "<leader>nif", "core.integrations.telescope.insert_file_link" },
    },

    i = { -- Bind in insert mode
      { "<C-i>", "core.integrations.telescope.insert_link" },
    },
  }, {
    silent = true,
    noremap = true,
  })
end)

-- desc = "Telescope Find Norg Files",
-- desc = "Telescope Search Headings",
-- desc = "Telescope Insert Link to Heading",
-- desc = "Telescope Insert Link to File",
