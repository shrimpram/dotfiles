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
    'org',
    'python',
    'regex',
    'rust',
    'toml',
    'yaml'
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = {'org'},
  },
}
