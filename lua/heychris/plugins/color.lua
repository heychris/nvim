return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup {
        extend_background_behind_borders = true,

        styles = {
          transparency = true,
          italic = false,
        },

        highlight_groups = {
          SignAdd = { fg = 'muted', bg = 'NONE' },
          SignChange = { fg = 'muted', bg = 'NONE' },
          SignDelete = { fg = 'muted', bg = 'NONE' },
        },
      }

      vim.cmd.colorscheme 'rose-pine'
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,
  },
}
