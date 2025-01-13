return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },

      -- suggestion = {
      --   auto_trigger = true,
      --   keymap = {
      --     accept = '<C-y>',
      --     next = '<M-]>',
      --     prev = '<M-[>',
      --   },
      -- },
      -- panel = { enabled = false },
      -- filetypes = {
      --   markdown = true,
      --   help = true,
      -- },
    },
  },

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
    event = 'VeryLazy',
    lazy = true,
    config = function()
      require 'heychris.config.lint'
    end,
  },

  {
    'dmmulroy/tsc.nvim',
    event = { 'VeryLazy' },
    opts = {},
  },
}
