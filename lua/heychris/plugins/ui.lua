return {
  -- Detect tabstop and shiftwidth automatically
  {
    'tpope/vim-sleuth',
    event = 'BufReadPre',
  },

  {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    config = function()
      require 'heychris.config.lualine'
    end,
  },
}
