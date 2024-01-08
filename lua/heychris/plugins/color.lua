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
          GitSignsAdd = { fg = 'muted', bg = 'none' },
          GitSignsChange = { fg = 'muted', bg = 'none' },
          GitSignsDelete = { fg = 'muted', bg = 'none' },
          GitSignsTopDelete = { fg = 'muted', bg = 'none' },
          GitSignsChangeDelete = { fg = 'muted', bg = 'none' },
          GitSignsUntracked = { fg = 'muted', bg = 'none' },
        },
      }

      vim.cmd.colorscheme 'rose-pine'
      -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
      -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    end,
  },
}
