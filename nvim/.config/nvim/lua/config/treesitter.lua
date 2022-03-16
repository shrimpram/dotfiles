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
    'fennel',
    'go',
    'html',
    'java',
    'javascript',
    'json',
    'jsonc',
    'lua',
    'make',
    'nix',
    'org',
    'python',
    'regex',
    'rust',
    'toml',
    'vim',
    'yaml'
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = { 'org', 'make' },
  },
}
