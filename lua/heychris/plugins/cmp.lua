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
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = 'v0.*',
    -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- see the "default configuration" section below for full documentation on how to define
      -- your own keymap.
      keymap = { preset = 'default' },

      highlight = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = true,
      },
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',

      -- experimental auto-brackets support
      accept = { auto_brackets = { enabled = true } },

      -- experimental signature help support
      trigger = { signature_help = { enabled = true } },
    },
  },
}
