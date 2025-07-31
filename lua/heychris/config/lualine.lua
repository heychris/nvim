local p = require("rose-pine.palette")

local theme = {
  normal = {
    a = { bg = p.none, fg = p.text },
    b = { bg = p.none, fg = p.muted },
    c = { bg = p.none, fg = p.muted },
  },
  insert = {
    a = { bg = p.none, fg = p.foam },
    b = { bg = p.none, fg = p.muted },
    c = { bg = p.none, fg = p.muted },
  },
  visual = {
    a = { bg = p.none, fg = p.iris },
    b = { bg = p.none, fg = p.muted },
    c = { bg = p.none, fg = p.muted },
  },
  replace = {
    a = { bg = p.none, fg = p.pine },
    b = { bg = p.none, fg = p.muted },
    c = { bg = p.none, fg = p.muted },
  },
  command = {
    a = { bg = p.none, fg = p.love },
    b = { bg = p.none, fg = p.muted },
    c = { bg = p.none, fg = p.muted },
  },
  inactive = {
    a = { bg = p.none, fg = p.base },
    b = { bg = p.none, fg = p.muted },
    c = { bg = p.none, fg = p.muted },
  },
}

local lualine_require = require("lualine_require")
lualine_require.require = require

require("lualine").setup({
  icons_enabled = false,
  sections = {
    lualine_a = { "mode" },
    lualine_b = {

      {
        color = { fg = p.text },

        "filename",
        file_status = true, -- Displays file status (readonly status, modified status)
        newfile_status = false, -- Display new file status (new file means no write after created)

        -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path
        -- 3: Absolute path, with tilde as the home directory
        -- 4: Filename and parent dir, with tilde as the home directory
        path = 3,
      },

      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        -- Displays diagnostics for the defined severity types
        sections = { "error", "warn" },
        colored = true, -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false, -- Show diagnostics even if there are none.
      },
    },
    lualine_c = {},
    lualine_x = {
      {
        color = { fg = p.text },
        "branch",
      },

      {
        function()
          local msg = "No Active Lsp"
          local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
          local clients = vim.lsp.get_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return string.format("[%s]", client.name)
            end
          end
          return msg
        end,
        icon = false,
      },
    },
    lualine_y = {},
    lualine_z = {},
  },
  options = {
    theme = theme,
    section_separators = "",
    component_separators = "",
  },
})
