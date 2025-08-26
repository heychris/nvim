local lp = require("catppuccin.palettes").get_palette("frappe")

-- rosewater = "#f2d5cf",
-- flamingo = "#eebebe",
-- pink = "#f4b8e4",
-- mauve = "#ca9ee6",
-- red = "#e78284",
-- maroon = "#ea999c",
-- peach = "#ef9f76",
-- yellow = "#e5c890",
-- green = "#a6d189",
-- teal = "#81c8be",
-- sky = "#99d1db",
-- sapphire = "#85c1dc",
-- blue = "#8caaee",
-- lavender = "#babbf1",
-- text = "#c6d0f5",
-- subtext1 = "#b5bfe2",
-- subtext0 = "#a5adce",
-- overlay2 = "#949cbb",
-- overlay1 = "#838ba7",
-- overlay0 = "#737994",
-- surface2 = "#626880",
-- surface1 = "#51576d",
-- surface0 = "#414559",
-- base = "#303446",
-- mantle = "#292c3c",
-- crust = "#232634",

local theme = {
  normal = {
    a = { bg = "None", fg = lp.text },
    b = { bg = "None", fg = lp.subtext1 },
    x = { bg = "None", fg = lp.subtext1 },
    y = { bg = "None", fg = lp.surface2 },
  },
  insert = {
    a = { bg = "None", fg = lp.sapphire },
    b = { bg = "None", fg = lp.subtext1 },
    x = { bg = "None", fg = lp.subtext1 },
    y = { bg = "None", fg = lp.surface2 },
  },
  visual = {
    a = { bg = "None", fg = lp.lavender },
    b = { bg = "None", fg = lp.subtext1 },
    x = { bg = "None", fg = lp.subtext1 },
    y = { bg = "None", fg = lp.surface2 },
  },
  replace = {
    a = { bg = "None", fg = lp.red },
    b = { bg = "None", fg = lp.subtext1 },
    x = { bg = "None", fg = lp.subtext1 },
    y = { bg = "None", fg = lp.surface2 },
  },
  command = {
    a = { bg = "None", fg = lp.maroon },
    b = { bg = "None", fg = lp.subtext1 },
    x = { bg = "None", fg = lp.subtext1 },
    y = { bg = "None", fg = lp.surface2 },
  },
}

local lualine_require = require("lualine_require")
lualine_require.require = require

require("lualine").setup({
  icons_enabled = false,
  sections = {
    lualine_a = {
      "mode",
    },
    lualine_b = {
      {
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
      "branch",
    },
    lualine_y = {
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
    lualine_z = {},
  },
  options = {
    theme = theme,
    section_separators = "",
    component_separators = "",
  },
})
