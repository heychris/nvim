return {
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspStart" },
    event = { "FileType" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      "yioneko/nvim-vtsls",

      "saghen/blink.cmp",

      {
        "j-hui/fidget.nvim",
        opts = {
          notification = {
            window = {
              winblend = 0,
              border = "rounded",
              x_padding = 0,
            },
          },
        },
      },
    },
    config = function()
      require("heychris.config.lsp")
    end,
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
