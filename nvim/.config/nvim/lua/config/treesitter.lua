local ts_configs = require('nvim-treesitter.configs')
local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

ts_configs.setup {
  ensure_installed = {
    'bash',
    'bibtex',
    'c',
    'c_sharp',
    'cmake',
    'comment',
    'cpp',
    'css',
    'go',
    'html',
    'java',
    'javascript',
    'json',
    'jsonc',
    'lua',
    'nix',
    'python',
    'regex',
    'rust',
    'toml',
    'yaml'
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  }
}

parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'},
}
