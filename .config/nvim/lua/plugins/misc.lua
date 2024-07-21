return {
  {
    "neomutt/neomutt.vim",
  },

  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>ut",
        "<cmd>UndotreeToggle<cr>",
        desc = "UndoTree",
      },
    },
  },
}
