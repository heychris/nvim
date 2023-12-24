return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  cmd = { 'LspInfo', 'LspStart' },
  event = { 'FileType' },
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
  config = function()
    require 'heychris.config.lsp'
  end,
}
