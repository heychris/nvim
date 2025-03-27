return {
  -- Git related plugins
  -- {
  --   'tpope/vim-fugitive',
  --   cmd = {
  --     'G',
  --     'Gcd',
  --     'Gclog',
  --     'Gdiffsplit',
  --     'Gdrop',
  --     'Gedit',
  --     'Ggrep',
  --     'Git',
  --     'Glcd',
  --     'Glgrep',
  --     'Gllog',
  --     'Gpedit',
  --     'Gread',
  --     'Gsplit',
  --     'Gtabedit',
  --     'Gvdiffsplit',
  --     'Gvsplit',
  --     'Gwq',
  --     'Gwrite',
  --   },
  --   lazy = true,
  --   event = { 'BufWritePost', 'BufReadPre' },
  -- },
  -- 'tpope/vim-rhubarb',
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      -- { '<leader>gh', '<cmd>DiffviewOpen<CR>', desc = 'DiffviewOpen' },
      { "<leader>gh", "<cmd>DiffviewFileHistory % --no-merges --follow<CR>", desc = "Git file history" },
    },
    config = function()
      require("heychris.config.diffview")
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gs", "<cmd>LazyGit<CR>", desc = "LazyGit" },
    },
  },

  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("heychris.config.gitsigns")
    end,
  },

  {
    "linrongbin16/gitlinker.nvim",
    config = function()
      require("gitlinker").setup()
    end,
  },
}
