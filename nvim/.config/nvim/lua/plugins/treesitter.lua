return {
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle"
  },
  {
    "nvim-treesitter/nvim-treesitter",
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
        }
      }
    end
  }
}
