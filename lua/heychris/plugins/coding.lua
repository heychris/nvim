return {
  {
    "yioneko/nvim-vtsls",
    config = function()
      require("heychris.config.typescript")
    end,
  },

  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
  },

  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = "ConformInfo",
    lazy = true,
    config = function()
      require("heychris.config.conform")
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    lazy = true,
    config = function()
      require("heychris.config.lint")
    end,
  },

  {
    "dmmulroy/tsc.nvim",
    event = { "VeryLazy" },
    opts = {},
  },

  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
}
