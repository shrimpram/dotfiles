return {

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        ensure_installed = {
          "bash",
          "bibtex",
          "c",
          "c_sharp",
          "cmake",
          "comment",
          "cpp",
          "css",
          "fennel",
          "go",
          "html",
          "java",
          "javascript",
          "json",
          "jsonc",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          "nix",
          "norg",
          "org",
          "python",
          "regex",
          "toml",
          "vim",
          "yaml",
        },
        highlight = {
          enable = true,
          use_languagetree = true,
          additional_vim_regex_highlighting = { "org", "make", "latex" },
        },
        indent = {
          enable = true,
        },
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    ft = "html",
  },
}
