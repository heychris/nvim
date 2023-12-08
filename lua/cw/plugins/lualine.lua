-- Hard code this for now
local subtle = '#908caa'

return {
  'nvim-lualine/lualine.nvim',
  enabled = true,
  config = function()
    require('lualine').setup {
      icons_enabled = false,
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'branch',
            color = { fg = subtle },
          },
          {
            'filename',
            color = { fg = subtle },
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
            colored = true, -- Displays diagnostics status in color if set to true.
            update_in_insert = false, -- Update diagnostics in insert mode.
            always_visible = false, -- Show diagnostics even if there are none.
          },
        },
        lualine_x = {
          {
            'location',
            color = { fg = subtle },
          },
          {
            'filetype',
            color = { fg = subtle },
          },
          {
            -- Lsp server name .
            function()
              local msg = 'No Active Lsp'
              local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return client.name
                end
              end
              return msg
            end,
            icon = 'LSP:',
            color = { fg = subtle },
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
      options = {
        section_separators = '',
        component_separators = '',
      },
    }
  end,
}
