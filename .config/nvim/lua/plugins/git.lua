return {
  {
    "rhysd/committia.vim",
    event = "BufReadPre COMMIT_EDITMSG,MERGE_MSG",
  },

  {
    "sindrets/diffview.nvim",
  },

  {
    "lewis6991/gitsigns.nvim",
    tag = "v0.8.1",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
        change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
        delete = { hl = "DiffDelete", text = "│", numhl = "GitSignsDeleteNr" },
        topdelete = { hl = "DiffDelete", text = "│", numhl = "GitSignsDeleteNr" },
        changedelete = { hl = "DiffDelete", text = "│", numhl = "GitSignsChangeNr" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next Hunk" })
        vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Prev Hunk" })

        vim.keymap.set(
          { "o", "x" },
          "ih",
          ":<C-U>Gitsigns select_hunk<CR>",
          { buffer = bufnr, desc = "GitSigns Select Hunk" }
        )

        vim.keymap.set("n", "<leader>gl", gs.blame_line, { desc = "Blame Line" })
        vim.keymap.set("n", "<leader>gL", function()
          gs.blame_line({ full = true })
        end, { desc = "Blame Line Full" })
        vim.keymap.set("n", "<leader>gp", gs.preview_hunk, { desc = "Preview Hunk" })
        vim.keymap.set("x", "<leader>gs", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Stage Hunk" })
        vim.keymap.set("n", "<leader>gsh", gs.stage_hunk, { desc = "Stage Hunk" })
        vim.keymap.set("n", "<leader>gsb", gs.stage_buffer, { desc = "Stage Buffer" })
        vim.keymap.set("n", "<leader>gsu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
        vim.keymap.set("n", "<leader>grh", gs.reset_hunk, { desc = "Reset Hunk" })
        vim.keymap.set("x", "<leader>gr", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Reset Hunk" })
        vim.keymap.set("n", "<leader>grb", gs.reset_buffer, { desc = "Reset Buffer" })
      end,
    },
  },

  {
    "TimUntersberger/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
    },
    cmd = "Neogit",
    opts = {
      highlight = {
        italic = false,
      },
      signs = {
        -- { CLOSED, OPENED }
        hunk = { "", "" },
        item = { "", "" },
        section = { "", "" },
      },
    },
    keys = {
      { "<leader>gg", vim.cmd.Neogit, desc = "Neogit" },
    },
  },
}
