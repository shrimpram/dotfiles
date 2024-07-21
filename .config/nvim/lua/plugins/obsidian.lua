return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/Documents/notes",
      },
    },
    daily_notes = { folder = "journal" },
    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url })
    end,
    disable_frontmatter = true,
    -- note_frontmatter_func = function(note)
    --   -- Add the title of the note as an alias.
    --   if note.id and string.find(note.id, "-") then
    --     -- note:add_alias(note.id)
    --     note:add_alias(note.id:gsub("-", " "))
    --   end
    --
    --   local out = { id = note.id, aliases = note.aliases, tags = note.tags }
    --
    --   -- `note.metadata` contains any manually added fields in the frontmatter.
    --   -- So here we just make sure those fields are kept in the frontmatter.
    --   if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
    --     for k, v in pairs(note.metadata) do
    --       out[k] = v
    --     end
    --   end
    --
    --   return out
    -- end,
  },
  keys = {
    {
      "<leader>of",
      "<cmd>ObsidianQuickSwitch<cr>",
      desc = "Switch Files",
    },
    {
      "<leader>os",
      "<cmd>ObsidianSearch<cr>",
      desc = "Search",
    },
    {
      "<leader>ot",
      "<cmd>ObsidianTags<cr>",
      desc = "Tags",
    },
    {
      "<leader>od",
      "<cmd>ObsidianToday<cr>",
      desc = "Go to Today",
    },
    {
      "<leader>ob",
      "<cmd>ObsidianBacklinks<cr>",
      desc = "View Backlinks",
    },
    {
      "<leader>or",
      "<cmd>ObsidianRename<cr>",
      desc = "Rename Document",
    },
    {
      "<leader>ol",
      "<cmd>ObsidianLink<cr>",
      desc = "Link",
      mode = "v",
    },
  },
}
