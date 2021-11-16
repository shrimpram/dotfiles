local wk = require('which-key')
local nest = require('nest')

wk.setup {
  plugins = {
    spelling = true
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
  { mode = 'nx', options = { noremap = false, silent = false } , {
    { 'gl', [[<Plug>(EasyAlign)]] },
  }},
}

wk.register {
  ['<leader>'] = {
    w = {
      name = '+write',
      w = { '<CMD>w<CR>', 'Write Buffer' },
      q = { '<CMD>wq<CR>', 'Write & Quit' },
    },
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
      },
    },
    n = {
      name = '+nvim-tree',
      t = { '<CMD>NvimTreeToggle<CR>', 'Toggle NvimTree' },
      r = { '<CMD>NvimTreeRefresh<CR>', 'Refresh NvimTree' },
      f = { '<CMD>NvimTreeFindFile<CR>', 'Find Current File' },
    },
    u = {
      name = '+undo-tree',
      t = { '<CMD>UndotreeToggle<CR>', 'Undotree' },
    },
    f = {
      name = '+finder',
      f = { '<CMD>Telescope find_files<CR>', 'Find Files' },
      g = { '<CMD>Telescope git_files<CR>', 'Find Git Files' },
      l = { '<CMD>Telescope live_grep<CR>', 'Grep Project' },
      c = { '<CMD> Telescope current_buffer_fuzzy_find<CR>', 'Fuzzy Current Buffer' },
      t = { '<CMD>Telescope file_browser<CR>', 'File Browser' },
      q = { '<CMD>Telescope quickfix<CR>', 'Quickfix' },
      b = { '<CMD>Telescope buffers show_all_buffers=true sort_lastused=true<CR>', 'Buffers' },
    },
  },
}
