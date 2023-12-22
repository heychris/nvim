return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
    lazy = true,
    config = function()
      require 'heychris.config.cmp'
    end,
  },

  {
    'hrsh7th/cmp-calc',
    event = 'InsertEnter',
    dependencies = 'hrsh7th/nvim-cmp',
  },

  {
    'hrsh7th/cmp-cmdline',
    event = 'CmdlineEnter',
    dependencies = 'hrsh7th/nvim-cmp',
  },

  {
    'hrsh7th/cmp-nvim-lsp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'neovim/nvim-lspconfig',
    },
  },

  {
    'hrsh7th/cmp-nvim-lsp-signature-help',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'neovim/nvim-lspconfig',
    },
  },

  {
    'saadparwaiz1/cmp_luasnip',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
    },
  },

  {
    'zbirenbaum/copilot-cmp',
    event = 'InsertEnter',
    dependencies = 'hrsh7th/nvim-cmp',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}
