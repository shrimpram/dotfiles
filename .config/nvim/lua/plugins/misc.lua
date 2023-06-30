return {
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
  },
  {
    "justinmk/vim-dirvish"
  },
  {
    "RRethy/vim-hexokinase",
    build = "make hexokinase",
    event = "VeryLazy"
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
