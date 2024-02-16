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

          FloatTitle = { fg = 'muted', bg = 'none' },
          TelescopeTitle = { fg = 'muted', bg = 'none' },

          DiagnosticVirtualTextError = { fg = 'love', bg = 'love', blend = 5 },
          DiagnosticVirtualTextHint = { fg = 'iris', bg = 'iris', blend = 5 },
          DiagnosticVirtualTextInfo = { fg = 'foam', bg = 'foam', blend = 5 },
          DiagnosticVirtualTextWarn = { fg = 'gold', bg = 'gold', blend = 5 },
        },
      }

      vim.cmd.colorscheme 'rose-pine'
    end,
  },
}
