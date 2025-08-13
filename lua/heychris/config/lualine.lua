local theme = {
  normal = {
    a = { bg = "NONE", fg = "Normal", gui = "bold" },
    b = { bg = "NONE", fg = "Normal" },
    c = { bg = "NONE", fg = "Normal" },
  },
  insert = { a = { fg = "Normal" } },
  visual = { a = { fg = "Normal" } },
  replace = { a = { fg = "Normal" } },
  command = { a = { fg = "Normal" } },
  inactive = {
    a = { bg = "NONE", fg = "Comment" },
    b = { bg = "NONE", fg = "Comment" },
    c = { bg = "NONE", fg = "Comment" },
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
        "filename",
        file_status = true,
        newfile_status = false,

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
      { "branch" },

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
