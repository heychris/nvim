return {
  -- Git related plugins
  {
    'tpope/vim-fugitive',
    cmd = {
      'G',
      'Gcd',
      'Gclog',
      'Gdiffsplit',
      'Gdrop',
      'Gedit',
      'Ggrep',
      'Git',
      'Glcd',
      'Glgrep',
      'Gllog',
      'Gpedit',
      'Gread',
      'Gsplit',
      'Gtabedit',
      'Gvdiffsplit',
      'Gvsplit',
      'Gwq',
      'Gwrite',
    },
    lazy = true,
    event = { 'BufWritePost', 'BufReadPre' },
  },
  -- 'tpope/vim-rhubarb',

  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gs', '<cmd>LazyGit<CR>', desc = 'LazyGit' },
    },
  },

  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = function()
      require 'heychris.config.gitsigns'
    end,
  },
}
