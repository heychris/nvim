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
          MiniCursorword = { bg = 'highlight_med' },
          SignAdd = { fg = 'muted', bg = 'none' },
          SignChange = { fg = 'muted', bg = 'none' },
          SignDelete = { fg = 'muted', bg = 'none' },
        },
      }

      vim.cmd.colorscheme 'rose-pine'
    end,
  },
}
