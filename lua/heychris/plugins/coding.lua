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

  -- {
  --   "folke/sidekick.nvim",
  --   lazy = false,
  --   opts = {
  --     nes = {
  --       enabled = true,
  --     },
  --   },
  --   keys = {
  --     {
  --       "<tab>",
  --       function()
  --         -- if there is a next edit, jump to it, otherwise apply it if any
  --         if not require("sidekick").nes_jump_or_apply() then
  --           return "<Tab>" -- fallback to normal tab
  --         end
  --       end,
  --       expr = true,
  --       desc = "Goto/Apply Next Edit Suggestion",
  --     },
  --   },
  --   setup = function()
  --     require("sidekick").setup({})
  --   end,
  -- },

  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
  -- {
  --   "copilotlsp-nvim/copilot-lsp",
  --   config = function()
  --     vim.g.copilot_nes_debounce = 300
  --   end,
  -- },
  --
  -- {
  --   "zbirenbaum/copilot.lua",
  --   requires = {
  --     "copilotlsp-nvim/copilot-lsp",
  --   },
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       panel = {
  --         enabled = false,
  --       },
  --       suggestion = {
  --         enabled = true,
  --         auto_trigger = true,
  --       },
  --       nes = {
  --         enabled = true,
  --         auto_trigger = true,
  --       },
  --     })
  --   end,
  -- },
}
