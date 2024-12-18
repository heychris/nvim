return {
  -- {
  --   'zbirenbaum/copilot.lua',
  --   cmd = 'Copilot',
  --   event = 'InsertEnter',
  --   opts = {
  --     suggestion = { enabled = false },
  --     panel = { enabled = false },
  --   },
  -- },

  {
    'yioneko/nvim-vtsls',
    config = function()
      require 'heychris.config.typescript'
    end,
  },

  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    keys = {
      { 'gc', mode = { 'n', 'x' } },
      { 'gb', mode = { 'n', 'x' } },
    },
    config = function()
      require 'heychris.config.comment'
    end,
  },

  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = 'ConformInfo',
    lazy = true,
    config = function()
      require 'heychris.config.conform'
    end,
  },

  {
    'mfussenegger/nvim-lint',
    event = 'LazyFile',
    config = function()
      require 'heychris.config.lint'
    end,
  },

  {
    'dmmulroy/tsc.nvim',
    event = { 'VeryLazy' },
    opts = {},
  },
  --
  -- {
  --   'mfussenegger/nvim-dap',
  --   dependencies = {
  --     'rcarriga/nvim-dap-ui',
  --     'theHamsta/nvim-dap-virtual-text',
  --     'nvim-neotest/nvim-nio',
  --     'folke/neoconf.nvim',
  --     'jay-babu/mason-nvim-dap.nvim',
  --     'williamboman/mason.nvim',
  --   },
  --   event = { 'VeryLazy' },
  --   lazy = true,
  --   config = function()
  --     require 'heychris.config.dap'
  --   end,
  -- },
}
