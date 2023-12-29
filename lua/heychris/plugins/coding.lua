return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },

  {
    'pmizio/typescript-tools.nvim',
    lazy = true,
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
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
    dependencies = { 'mason.nvim' },
    lazy = true,
    cmd = 'ConformInfo',
    config = function()
      require 'heychris.config.conform'
    end,
  },

  {
    'mfussenegger/nvim-lint',
    event = { 'VeryLazy' },
    lazy = true,
    -- opts = {
    --   events = { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
    --   linters_by_ft = {
    --     lua = { 'luacheck' },
    --     -- ['*'] = { 'global linter' },
    --     -- ['_'] = { 'fallback linter' },
    --   },
    -- },
    config = function()
      require 'heychris.config.lint'
    end,
  },
}
