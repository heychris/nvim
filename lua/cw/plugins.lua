return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Undotree
  {
    'mbbill/undotree',
    lazy = true,
    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, desc = 'Toggle undotree' },
    },
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    lazy = true,
    opts = {},
  },
}
