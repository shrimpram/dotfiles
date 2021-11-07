require('gitsigns').setup{
  signs = {
    add          = {hl = 'DiffAdd',    text = '│', numhl = 'GitSignsAddNr'   },
    change       = {hl = 'DiffChange', text = '│', numhl = 'GitSignsChangeNr'},
    delete       = {hl = 'DiffDelete', text = '│', numhl = 'GitSignsDeleteNr'},
    topdelete    = {hl = 'DiffDelete', text = '│', numhl = 'GitSignsDeleteNr'},
    changedelete = {hl = 'DiffDelete', text = '│', numhl = 'GitSignsChangeNr'}
  },
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ]h'] = { expr = true, "&diff ? ']h' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [h'] = { expr = true, "&diff ? '[h' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
},
}
