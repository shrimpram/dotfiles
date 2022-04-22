local wk = require('which-key')
local nest = require('nest')

wk.setup {
  plugins = {
    registers = true,
    spelling = true,
  },
  triggers = {
    '<leader>',
    'z',
    [["]],
    [[']],
    [[`]],
  },
  hidden = {
    '<Plug>',
  },
}

nest.applyKeymaps {
  { mode = 'v', {
    { '<', '<gv' },
    { '>', '>gv' },
  }},
  { mode = 'nv', options = { expr = true }, {
    { 'j', [[v:count ? 'j' : 'gj']] },
    { 'k', [[v:count ? 'k' : 'gk']] },
  }},
  { '<M-', {
    { 'j>', [[<CMD>lua require('utils').resize(false, 2)<CR>]] },
    { 'k>', [[<CMD>lua require('utils').resize(false, -2)<CR>]] },
    { 'l>', [[<CMD>lua require('utils').resize(true, 2)<CR>]] },
    { 'h>', [[<CMD>lua require('utils').resize(true, -2)<CR>]] },
  }},
  { '<C-', {
    { 'h>', '<C-w>h' },
    { 'j>', '<C-w>j' },
    { 'k>', '<C-w>k' },
    { 'l>', '<C-w>l' },
  }},
  { mode = 'nx', options = { noremap = false, silent = false }, {
    { 'gl', [[<Plug>(EasyAlign)]] },
  }},
  { mode = 'v', {
    { 'gs', [[:'<,'>ScratchSelection<CR>]] },
  }},
}


wk.register({
  w = {
    name = '+write',
    w = { '<CMD>w<CR>', 'Write Buffer' },
    q = { '<CMD>wq<CR>', 'Write & Quit' },
  },
}, { prefix = '<leader>' })

wk.register({
  g = {
    name = '+git',
    g = { '<CMD>Neogit<CR>', 'Neogit' },
    b = { [[<CMD>lua require('gitsigns').blame_line(true)<CR>]], 'Blame Line' },
    p = { [[<CMD>lua require('gitsigns').preview_hunk()<CR>]], 'Preview Hunk' },
    s = { [[<CMD>lua require('gitsigns').stage_hunk()<CR>]], 'Stage Hunk' },
    u = { [[<CMD>lua require('gitsigns').undo_stage_hunk()<CR>]], 'Undo Stage Hunk' },
    r = {
      name = '+reset',
      h = { [[<CMD>lua require('gitsigns').reset_hunk()<CR>]], 'Reset Hunk' },
      b = { [[<CMD>lua require('gitsigns').reset_buffer()<CR>]], 'Reset Buffer' },
    }
  }
}, { prefix = '<leader>' })

wk.register({
  g = {
    name = '+git',
    s = { [[<CMD>'<,'>lua require('gitsigns').stage_hunk()<CR>]], 'Stage Hunk' },
    u = { [[<CMD>'<,'>lua require('gitsigns').undo_stage_hunk()<CR>]], 'Undo Stage Hunk' },
    r = { [[<CMD>'<,'>lua require('gitsigns').reset_hunk()<CR>]], 'Reset Hunk' },
  }
}, { mode = 'v', prefix = '<leader>' })

wk.register({
  n = {
    name = '+nvim-tree',
    t = { '<CMD>NvimTreeToggle<CR>', 'Toggle NvimTree' },
    r = { '<CMD>NvimTreeRefresh<CR>', 'Refresh NvimTree' },
    f = { '<CMD>NvimTreeFindFile<CR>', 'Find Current File' },
  }
}, { prefix = '<leader>' })

wk.register({
  u = {
    name = '+undo-tree',
    t = { '<CMD>UndotreeToggle<CR>', 'Undotree' },
  }
}, { prefix = '<leader>' })

wk.register({
  f = {
    name = '+finder',
    f = { function() require('telescope.builtin').find_files({ follow = true, hidden = true, no_ignore = true, }) end, 'Find Files' },
    g = { '<CMD>Telescope git_files<CR>', 'Find Git Files' },
    l = { '<CMD>Telescope live_grep<CR>', 'Grep Project' },
    c = { '<CMD> Telescope current_buffer_fuzzy_find<CR>', 'Fuzzy Current Buffer' },
    t = { '<CMD>Telescope file_browser<CR>', 'File Browser' },
    q = { '<CMD>Telescope quickfix<CR>', 'Quickfix' },
    b = { '<CMD>Telescope buffers show_all_buffers=true sort_lastused=true<CR>', 'Buffers' }
  }
}, { prefix = '<leader>' })

wk.register({
  s = {
    name = '+scratch',
    s = { '<CMD>Scratch<CR>', 'Open Scratch Buffer' },
    p = { '<CMD>ScratchPreview<CR>', 'Preview Scratch Buffer' },
  },
}, { prefix = '<leader>' })

wk.register({
  o = {
    name = '+orgmode',
    c = { 'Org Capture' },
    a = { 'Org Agenda' },
    r = { 'Refile subtree' },
    o = { 'Open hyperlink' },
    t = { 'Change tags' },
    A = { 'Toggle archive tag' },
    K = { 'Move subtree up' },
    J = { 'Move subtree down' },
    e = { 'Export' },
  },
  oi = {
    h = { 'Add new headline after subtree' },
    T = { 'Add new TODO on next line' },
    t = { 'Add new TODO after subtree' },
    d = { 'Insert/update deadline' },
    s = { 'Insert/update scheduled' },
  }
}, { prefix = '<leader>' })
