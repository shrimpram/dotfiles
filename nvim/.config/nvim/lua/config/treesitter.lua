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
    'latex',
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
