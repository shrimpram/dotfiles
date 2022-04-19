local map = vim.api.nvim_set_keymap
-- Automatically compiles packer after writing to the plugins.lua file
vim.cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]

return require('packer').startup(function()

  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'

  -- Keybindings
  use {
    'folke/which-key.nvim',
    event = 'VimEnter',
    config = function()
      require('config.mappings')
    end,
    requires = {
      'LionC/nest.nvim',
      opt = true,
    },
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
  use 'rhysd/committia.vim'

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
      cmd = 'Neogit'
    }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim', opt = true},
      {'nvim-lua/plenary.nvim', opt = true},
      {'nvim-telescope/telescope-file-browser.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    },
    event = 'VimEnter',
    config = function()
      vim.cmd([[command! Colorscheme Telescope colorscheme]])

      require('telescope').setup {
        extensions = {
          file_browser,
          fzf,
        },
      }

      require('telescope').load_extension('file_browser')
      require('telescope').load_extension('fzf')
    end,
  }

  -- Text formatting

  --- Align
  use 'junegunn/vim-easy-align'

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
      vim.g.undotree_SetFocusWhenToggle = '1'
    end,
    cmd = 'UndotreeToggle'
  }

  --- File Tree (lua NERDTree)
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true, },
    cmd = { 'NvimTreeToggle', 'NvimTreeRefresh', 'NvimTreeFindFile' },
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

  --- Lisp
  use {
    'eraserhd/parinfer-rust',
    run = "cargo build --release",
  }

  -- Utilities

  --- Scratch buffer
  use {
    'mtth/scratch.vim',
    config = function()
      vim.g.scratch_no_mappings = 1
      vim.g.scratch_top = 0
      vim.g.scratch_persistence_file = "~/.local/share/nvim/scratch"
    end,
  }

  --- Org Mode
  use {
    'nvim-orgmode/orgmode',
    requires = {
      { 'nvim-lua/plenary.nvim', opt = true },
      { 'nvim-treesitter/nvim-treesitter' },
    },
    config = function()
      require('orgmode').setup_ts_grammar()

      require('orgmode').setup {
        org_indent_mode = 'noindent',
        org_agenda_files = '~/Dropbox/org/*',
        org_default_notes_file = '~/Dropbox/org/inbox.org',
        org_deadline_warning_days = 2,
        org_use_tag_inheritance = true,
        org_agenda_span = 'day',
        org_agenda_templates = {
          e = { description = 'Event', template = '* %?\n %t\n %u' },
          t = { description = 'Task', template = '* TODO %?\n %u' },
          h = { description = 'Here in the file', template = '* TODO %?\n %a\n %u' },
        },
        mappings = {
          org = {
            org_show_help = '<leader>o?',
            org_edit_src_show_help = '<leader>o?'
          },
          agenda = {
            org_agenda_show_help = '<leader>o?'
          },
          capture = {
            org_capture_show_help = '<leader>o?'
          },
        },
      }
    end
  }

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
    'nvim-lualine/lualine.nvim',
    config = function()
      require('config.lualine')
    end,
  }

  --- Async building
  use {
    'neomake/neomake',
    setup = function()
      vim.g.neomake_verbose = 1
      vim.g.neomake_open_list = 2
      vim.g.neomake_tex_enabled_makers = { 'chktex' }
      vim.g.neomake_error_sign = { text = '✖' }
      vim.g.neomake_warning_sign = { text = '‼' }
      vim.g.neomake_info_sign = { text = '' }
      vim.g.neomake_message_sign = { text = '' }
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
  use { 'vim-scripts/fountain.vim', ft = 'fountain' }

  -- Mustache/Handlebars
  use { 'mustache/vim-mustache-handlebars', ft = 'html' }

  -- Ledger
  use { 'ledger/vim-ledger', ft = 'ledger' }

  -- Colorschemes
  use {
    '$HOME/Documents/stella/vim',
    as = 'stella'
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

end)
