local palette = require 'rose-pine.palette'

local theme = {
  normal = {
    a = { fg = palette.rose, bg = palette.overlay },
    b = { fg = palette.muted, bg = palette.none },

    x = { fg = palette.muted, bg = palette.none },
  },

  insert = {
    a = { fg = palette.foam, bg = palette.overlay },
  },

  visual = {
    a = { fg = palette.iris, bg = palette.overlay },
  },

  command = {
    a = { fg = palette.love, bg = palette.overlay },
  },

  inactive = {
    a = { fg = palette.muted, bg = palette.none },
    b = { fg = palette.muted, bg = palette.none },

    x = { fg = palette.muted, bg = palette.none },
  },
}

-- PERF: We don't need this apparently
local lualine_require = require 'lualine_require'
lualine_require.require = require

require('lualine').setup {
  icons_enabled = false,
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      { 'branch' },

      {
        'filename',
        file_status = false, -- Displays file status (readonly status, modified status)
        newfile_status = false, -- Display new file status (new file means no write after created)

        -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path
        -- 3: Absolute path, with tilde as the home directory
        -- 4: Filename and parent dir, with tilde as the home directory
        path = 1,
      },

      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        -- Displays diagnostics for the defined severity types
        sections = { 'error', 'warn' },
        colored = false, -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false, -- Show diagnostics even if there are none.
      },
    },
    lualine_c = {},
    lualine_x = {
      {
        function()
          local linters = require('lint').get_running()

          if #linters == 0 then
            return ''
          end
          return table.concat(linters, ', ')
        end,
      },

      {
        'filetype',
      },

      {
        -- Lsp server name .
        function()
          local msg = 'No Active Lsp'
          local bufnr = vim.api.nvim_get_current_buf()
          local clients = vim.lsp.get_clients { bufnr = bufnr }

          if next(clients) == nil then
            return msg
          end

          local client_names = {}
          for _, client in ipairs(clients) do
            client_names[#client_names + 1] = client.name
          end

          if #client_names > 2 then
            return string.format('[%s, %s, and %d more]', client_names[1], client_names[2], #client_names - 2)
          end

          return string.format('[%s]', table.concat(client_names, ', '))
        end,
        icon = false,
      },
      -- {
      --   'location',
      --   color = { fg = subtle },
      -- },
    },
    lualine_y = {},
    lualine_z = {},
  },
  options = {
    theme = theme,
    section_separators = '',
    component_separators = '',
  },
}
