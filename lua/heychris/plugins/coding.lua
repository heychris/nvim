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

  {
    'folke/trouble.nvim',
    cmd = { 'TroubleToggle', 'Trouble' },
    keys = {
      { '<leader>xx', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Document Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Workspace Diagnostics (Trouble)' },
      { '<leader>xL', '<cmd>TroubleToggle loclist<cr>', desc = 'Location List (Trouble)' },
      { '<leader>xQ', '<cmd>TroubleToggle quickfix<cr>', desc = 'Quickfix List (Trouble)' },
      {
        '[q',
        function()
          if require('trouble').is_open() then
            require('trouble').previous { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Previous trouble/quickfix item',
      },
      {
        ']q',
        function()
          if require('trouble').is_open() then
            require('trouble').next { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Next trouble/quickfix item',
      },
    },
  },
}
