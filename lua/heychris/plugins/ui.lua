return {
  -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-sleuth',
    event = 'VeryLazy',
  },

  {
    'nvim-tree/nvim-web-devicons',
    event = 'VeryLazy',
  },

  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = ' '
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    config = function()
      require 'heychris.config.lualine'
    end,
  },
  --
  -- {
  --   'folke/flash.nvim',
  --   event = 'VeryLazy',
  --   opts = {
  --     modes = {
  --       char = {
  --         enabled = false,
  --       },
  --     },
  --   },
  --   keys = {
  --     {
  --       's',
  --       mode = { 'n', 'x', 'o' },
  --       function()
  --         require('flash').jump()
  --       end,
  --       desc = 'Flash',
  --     },
  --     {
  --       'S',
  --       mode = { 'n', 'x', 'o' },
  --       function()
  --         require('flash').treesitter()
  --       end,
  --       desc = 'Flash Treesitter',
  --     },
  --     {
  --       'r',
  --       mode = 'o',
  --       function()
  --         require('flash').remote()
  --       end,
  --       desc = 'Remote Flash',
  --     },
  --     {
  --       'R',
  --       mode = { 'o', 'x' },
  --       function()
  --         require('flash').treesitter_search()
  --       end,
  --       desc = 'Treesitter Search',
  --     },
  --     {
  --       '<c-s>',
  --       mode = { 'c' },
  --       function()
  --         require('flash').toggle()
  --       end,
  --       desc = 'Toggle Flash Search',
  --     },
  --   },
  -- },
}
