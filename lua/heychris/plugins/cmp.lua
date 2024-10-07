return {
  -- {
  --   'hrsh7th/nvim-cmp',
  --   version = false, -- Last release is pretty old
  --   event = 'InsertEnter',
  --   dependencies = {
  --     -- Snippet Engine & its associated nvim-cmp source
  --     'L3MON4D3/LuaSnip',
  --
  --     -- Adds a number of user-friendly snippets
  --     'rafamadriz/friendly-snippets',
  --   },
  --   config = function()
  --     require 'heychris.config.cmp'
  --   end,
  -- },
  --
  -- {
  --   'hrsh7th/cmp-calc',
  --   event = 'InsertEnter',
  --   dependencies = 'hrsh7th/nvim-cmp',
  -- },
  --
  -- {
  --   'hrsh7th/cmp-cmdline',
  --   event = 'CmdlineEnter',
  --   dependencies = 'hrsh7th/nvim-cmp',
  -- },
  --
  -- {
  --   'hrsh7th/cmp-nvim-lsp',
  --   event = 'InsertEnter',
  --   dependencies = {
  --     'hrsh7th/nvim-cmp',
  --     'neovim/nvim-lspconfig',
  --   },
  -- },
  --
  -- {
  --   'hrsh7th/cmp-nvim-lsp-signature-help',
  --   event = 'InsertEnter',
  --   dependencies = {
  --     'hrsh7th/nvim-cmp',
  --     'neovim/nvim-lspconfig',
  --   },
  -- },
  --
  -- {
  --   'saadparwaiz1/cmp_luasnip',
  --   event = 'InsertEnter',
  --   dependencies = {
  --     'hrsh7th/nvim-cmp',
  --     'L3MON4D3/LuaSnip',
  --   },
  -- },
  -- {
  --   'zbirenbaum/copilot-cmp',
  --   event = 'InsertEnter',
  --   dependencies = 'hrsh7th/nvim-cmp',
  --   config = function()
  --     require('copilot_cmp').setup()
  --   end,
  -- },
  {
    'saghen/blink.cmp',
    lazy = false,
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = {
        show = '<C-Space>',
        hide = '<C-e>',
        accept = '<C-y>',
        select_prev = '<C-p>',
        select_next = '<C-n>',
      },
      windows = {
        autocomplete = {
          border = 'single',
        },
        documentation = {
          border = 'single',
        },
      },
      highlight = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = true,
      },
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'normal',

      -- experimental auto-brackets support
      accept = { auto_brackets = { enabled = true } },

      -- experimental signature help support
      trigger = { signature_help = { enabled = true } },
    },
  },
}
