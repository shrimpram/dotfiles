return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "-",
        function()
          require("oil").open()
        end,
        desc = "Open parent directory",
      },
    },
    config = function()
      require("oil").setup()
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = {
      {
        "<leader>hz",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Harpoon mark file",
      },
      {
        "<leader>hx",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Harpoon next file",
      },
      {
        "<leader>hc",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Harpoon prev file",
      },
      {
        "<leader>hv",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Harpoon toggle ui",
      },
      {
        "<leader>ha",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Harpoon file 1",
      },
      {
        "<leader>hr",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Harpoon file 2",
      },
      {
        "<leader>hs",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "Harpoon file 3",
      },
      {
        "<leader>ht",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        desc = "Harpoon file 4",
      },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
