return {
  'neovim/nvim-lspconfig',
  cmd = { 'LspInfo', 'LspStart' },
  event = { 'FileType' },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    {
      'j-hui/fidget.nvim',
      opts = {
        progress = {
          display = {
            done_icon = '󰄬',
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
