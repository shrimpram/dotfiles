local map = vim.api.nvim_set_keymap
-- Automatically compiles packer after writing to the plugins.lua file
vim.cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]

return require('packer').startup(function()

  use 'wbthomason/packer.nvim'

  use {
    'editorconfig/editorconfig-vim',
    event = 'VimEnter',
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      {'nvim-treesitter/playground', opt = true}
    },
    config = function() require('config.treesitter') end,
    run = ':TSUpdate',
  }

  -- Git
  use {
    'rhysd/committia.vim'
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim', opt = true },
    config = function() require('config.gitsigns') end,
    event = 'VimEnter',
  }

    use {
      'TimUntersberger/neogit',
      requires = { 'nvim-lua/plenary.nvim', opt = true },
      config = function() require('neogit').setup{} end,
      setup = map( 'n', '<leader>ng', [[<CMD>Neogit<CR>]], {noremap = true, silent = true} ),
      cmd = 'Neogit'
    }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    event = 'VimEnter',
    config = function() require('config.telescope') end,
  }

  -- Text formatting

  --- Align
  use {
    'junegunn/vim-easy-align',
    config = function()
      vim.api.nvim_set_keymap( 'n', 'gl', [[<Plug>(EasyAlign)]], {} )
      vim.api.nvim_set_keymap( 'x', 'gl', [[<Plug>(EasyAlign)]], {} )
    end,
    keys = { 'gl' }
  }

  --- Commenting
  use {
    'numToStr/Comment.nvim',
    keys = { 'gcc', 'gc', 'gb', 'gcA', 'gco', 'gcO' },
    config = function() require('comment').setup() end,
  }


  -- File Management

  --- Undo History
  use {
    'mbbill/undotree',
    config = function()
      vim.api.nvim_set_keymap( 'n', '<leader>ut', [[<CMD>UndotreeToggle<CR>]], {noremap = true, silent = true} )
      vim.g.undotree_SetFocusWhenToggle = '1'
    end,
    keys = '<leader>ut',
    cmd = 'UndotreeToggle'
  }

  --- File Tree (lua NERDTree)
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    keys = { '<leader>nt', '<leader>nf',  },
    config = function()
      require('config.nvim-tree')
    end,
  }


  -- Text editing

  --- More text objects for matching parens
  use 'wellle/targets.vim'

  --- Add/del/replace parens
  use {
    'machakann/vim-sandwich',
    keys = { 'sa', 'sd', 'sr' }
  }

  --- Snippets
  use {
    'L3MON4D3/LuaSnip',
    config = function()
      require('config.luasnip')
    end,
    event = 'InsertEnter'
  }

  --[[ use {
    'hrsh7th/vim-vsnip',
    ft = 'tex',
    config = function() require('config.vsnip') end,
  }

  --- Completion
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      vim.o.completeopt = 'menu,menuone,noinsert'

      local cmp = require('cmp')
      require('cmp').setup {
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = 'vsnip' },
        },
      }
    end,
  }

  use {
    'hrsh7th/cmp-vsnip',
    event = 'InsertEnter *',
  } --]]


  -- Utilities

  --- Org Mode
  --[[ use {
    'kristijanhusak/orgmode.nvim',
    requires = { 'nvim-lua/plenary.nvim', opt = true },
    config = function()
      require('orgmode').setup{
        org_agenda_files = '~/Dropbox/org/*',
        org_default_notes_file = '~/Sync/org/inbox.org',
        org_deadline_warning_days = 2,
        org_use_tag_inheritance = true,
        org_agenda_span = 'day',
        org_agenda_templates = {
          t = { description = 'Task', template = '* TODO %?\n %u' },
          d = { description = 'Delay', template = '* WAIT %?\n %a\n %u' },
          h = { description = 'Here in the file', template = '* TODO %?\n %a\n %u' },
        },
      }
    end
  } --]]

  --- Search
  use {
    'romainl/vim-cool',
    config = vim.cmd([[set hlsearch]]),
    keys = { '/', '?', ':', '*', '#', 'g*', 'g#', 'n', 'N' }
  }

  use {
    'PeterRincker/vim-searchlight',
    event = 'VimEnter'
  }

  --- Better movement

  use {
    'phaazon/hop.nvim',
    config = function()
      vim.api.nvim_set_keymap( 'n', 'x', "<CMD>HopChar2<CR>", {noremap = true, silent = true} )
      vim.api.nvim_set_keymap( 'v', 'x', "<CMD>HopChar2<CR>", {noremap = true, silent = true} )
      vim.api.nvim_set_keymap( 'x', 'x', "<CMD>HopChar2<CR>", {noremap = true, silent = true} )
      vim.api.nvim_set_keymap( 'o', 'x', "<CMD>HopChar2<CR>", {noremap = true, silent = true} )
      require('hop').setup {
        keys = 'arstneiouyzxcv'
      }
    end,
    keys = { 'x' },
  }

  --- Smooth scroll
  use {
    'karb94/neoscroll.nvim',
    config = function() require('neoscroll').setup{} end,
    event = 'WinScrolled',
  }

  --- Statusline
  use {
    'ojroques/nvim-hardline',
    config = function() require('hardline').setup { theme = 'stella' } end,
  }

  --- Async building
  use {
    'neomake/neomake',
    setup = function()
      vim.g.neomake_verbose = 1
      vim.g.neomake_open_list = 2
      vim.api.nvim_set_keymap( 'n', ']c', [[<CMD>cnext<CR>]], {noremap = true, silent = true} )
      vim.api.nvim_set_keymap( 'n', '[c', [[<CMD>cprev<CR>]], {noremap = true, silent = true} )
      vim.api.nvim_set_keymap( 'n', ']l', [[<CMD>lnext<CR>]], {noremap = true, silent = true} )
      vim.api.nvim_set_keymap( 'n', '[l', [[<CMD>lprev<CR>]], {noremap = true, silent = true} )
    end,
    config = function() vim.cmd("call neomake#configure#automake('w')") end,
    event = 'BufWrite'
  }

  --- Startuptime Profiler
  use {
    'tweekmonster/startuptime.vim',
    cmd = 'StartupTime'
  }

  --- Discord Rich Presence
  use {
    'andweeb/presence.nvim',
    event = 'VimEnter'
  }


  -- Aesthetics

  --- Display colors
  use {
    'rrethy/vim-hexokinase',
    run = 'make hexokinase',
    cmd = { 'HexokinaseToggle', 'HexokinaseTurnOn', 'HexokinaseTurnOff' },
    config = function() vim.g.Hexokinase_highlighters = { 'virtual' } end,
  }

  --- Focus window
  use {
    'junegunn/goyo.vim',
    cmd = { 'Goyo' },
    config = function()
      vim.cmd('Gitsigns toggle_signs')
      vim.cmd('set linebreak')
    end,
  }


  -- Latex
  use { 'lervag/vimtex', ft = 'tex' }

  -- Fountain
  use 'vim-scripts/fountain.vim'


  -- Colorschemes

  use {
    '$HOME/Documents/stella/vim-stella'
  }

  -- use {
  --   -- 'romainl/Apprentice',
  --   -- 'ayu-theme/ayu-vim',
  --   -- 'sjl/badwolf',
  --   -- 'chriskempson/base16-vim',
  --   -- 'reedes/vim-colors-pencil',
  --   -- 'nightsense/cosmic_latte',
  --   -- 'romainl/vim-dichromatic',
  --   -- 'wadackel/vim-dogrun',
  --   'romgrk/doom-one.vim',
  --   -- 'sainnhe/everforest',
  --   'fcpg/vim-fahrenheit',
  --   'jaredgorski/fogbell.vim',
  --   -- 'sainnhe/gruvbox-material',
  --   -- 'lifepillar/vim-gruvbox8',
  --   -- 'savq/melange',
  --   -- 'arcticicestudio/nord-vim',
  --   -- 'mhartington/oceanic-next',
  --   -- 'joshdick/onedark.vim',
  --   -- 'fcpg/vim-orbital',
  --   -- 'drewtempelmeyer/palenight.vim',
  --   -- 'tyrannicaltoucan/vim-quantum',
  --   'lifepillar/vim-solarized8',
  --   -- 'srcery-colors/srcery-vim',
  --   -- 'nightsense/stellarized',
  --   cmd = { 'Colorscheme', 'colorscheme' },
  -- }

-- use { 'christoomey/vim-tmux-navigator' }
-- use { 'RyanMillerC/better-vim-tmux-resizer' }

end)
