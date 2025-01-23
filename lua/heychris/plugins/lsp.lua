return {
  'neovim/nvim-lspconfig',
  cmd = { 'LspInfo', 'LspStart' },
  event = { 'FileType' },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    'yioneko/nvim-vtsls',

    'saghen/blink.cmp',

    {
      'j-hui/fidget.nvim',
      opts = {
        notification = {
          window = {
            winblend = 0,
            border = 'rounded',
            x_padding = 0,
          },
        },
      },
    },

    'folke/neodev.nvim',
  },
  config = function()
    require 'heychris.config.lsp'
  end,
}
