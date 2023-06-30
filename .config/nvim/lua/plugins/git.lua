return {
  {
    "rhysd/committia.vim",
    event = "BufReadPre COMMIT_EDITMSG,MERGE_MSG"
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup {
        signs = {
          add          = {hl = "DiffAdd",    text = "│", numhl = "GitSignsAddNr"   },
          change       = {hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr"},
          delete       = {hl = "DiffDelete", text = "│", numhl = "GitSignsDeleteNr"},
          topdelete    = {hl = "DiffDelete", text = "│", numhl = "GitSignsDeleteNr"},
          changedelete = {hl = "DiffDelete", text = "│", numhl = "GitSignsChangeNr"}
        },

        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          vim.keymap.set({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")

          vim.keymap.set("n", "]h", function()
            if vim.wo.diff then return "]h" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, {expr=true})

          vim.keymap.set("n", "[h", function()
            if vim.wo.diff then return "[h" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, {expr=true})
        end
      }
    end
  },
  {
    "TimUntersberger/neogit",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = true,
    cmd = "Neogit",
    config = true,
  }
}
