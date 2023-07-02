return {
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
  },
  {
    "justinmk/vim-dirvish"
  },
  {
    "NvChad/nvim-colorizer.lua",
    config = function ()
      require("colorizer").setup({
        user_default_options = {
          tailwind = true,
        },
      })
    end,
  },
  {
    "mickael-menu/zk-nvim",
    config = function()
      require("zk").setup({
        picker = "telescope",
      })
    end
  }
}
