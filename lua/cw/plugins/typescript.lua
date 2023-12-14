return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  -- {
  --   'OlegGulevskyy/better-ts-errors.nvim',
  --   dependencies = { 'MunifTanjim/nui.nvim' },
  --   config = {
  --     keymaps = {
  --       toggle = '<leader>dd', -- default '<leader>dd'
  --       -- go_to_definition = '<leader>dx' default '<leader>dx'
  --     },
  --   },
  -- },
  {
    'davidosomething/format-ts-errors.nvim',
  },
}
