return {
  {
    "tpope/vim-sleuth",
    event = "VeryLazy",
  },

  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline until lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    config = function()
      require("heychris.config.lualine")
    end,
  },

  { "kevinhwang91/nvim-bqf" },
}
