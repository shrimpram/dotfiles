return {
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {"windwp/nvim-ts-autotag"},
    config = function()
      require "nvim-treesitter.configs".setup {
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
          "nix",
          "norg",
          "org",
          "python",
          "regex",
          "toml",
          "vim",
          "yaml"
        },
        highlight = {
          enable = true,
          use_languagetree = true,
          additional_vim_regex_highlighting = { "org", "make" },
        },
        autotag = {
          enable = true,
        },
      }
    end
  },
  {
    "windwp/nvim-ts-autotag"
  }
}
