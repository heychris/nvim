return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
          terminal = false,
          legacy_highlights = false,
          migrations = false,
        },

        styles = {
          transparency = true,
          italic = false,
        },

        highlight_groups = {
          ["@property"] = { fg = "text", italic = false },
          MiniCursorword = { bg = "highlight_med" },
          SignAdd = { fg = "muted", bg = "none" },
          SignChange = { fg = "muted", bg = "none" },
          SignDelete = { fg = "muted", bg = "none" },

          FloatTitle = { fg = "muted", bg = "none" },
          TelescopeTitle = { fg = "muted", bg = "none" },

          DiagnosticVirtualTextError = { fg = "love", bg = "love", blend = 5 },
          DiagnosticVirtualTextHint = { fg = "iris", bg = "iris", blend = 5 },
          DiagnosticVirtualTextInfo = { fg = "foam", bg = "foam", blend = 5 },
          DiagnosticVirtualTextWarn = { fg = "gold", bg = "gold", blend = 5 },

          -- FzfLuaNormal = { fg = colors.fg },
          -- FloatBorder = { fg = "highlight_med" },
          FzfLuaBorder = { fg = "highlight_med" },
          FloatBorder = { fg = "highlight_med" },
          LazyGitBorder = { fg = "highlight_med" },
          -- FzfLuaHeaderText = { fg = colors.fg },
          -- FzfLuaHeaderBind = { fg = colors.symbol },
        },
      })

      vim.cmd.colorscheme("rose-pine")
    end,
  },

  {
    "datsfilipe/vesper.nvim",
    lazy = false,
    config = function()
      local colors = require("vesper.colors")
      local mix = require("vesper.utils").mix

      local function diagnosticBg(color)
        return mix(color, "#000000", 0.1)
      end

      require("vesper").setup({
        transparent = true,
        italics = {
          comments = true,
          keywords = false,
          functions = false,
          string = false,
          variables = false,
        },
        overrides = {
          GitSignsAdd = { fg = colors.border },
          GitSignsChange = { fg = colors.border },
          GitSignsDelete = { fg = colors.border },

          FloatBorder = { fg = colors.border },
          TelescopeBorder = { fg = colors.border },
          FloatTitle = { fg = colors.border },

          TelescopeTitle = { fg = colors.borderDarker },

          TelescopeMatching = { fg = colors.yellowDark },
          TelescopeSelectionCaret = { fg = colors.yellowDark },
          TelescopePromptPrefix = { fg = colors.green },
          TelescopePromptNormal = { fg = colors.secondary },
          TelescopeMultiSelection = { fg = colors.yellowDark },

          DiagnosticUnderlineError = { undercurl = true },
          DiagnosticUnderlineWarn = { undercurl = true },
          DiagnosticUnderlineInfo = { undercurl = true },
          DiagnosticUnderlineHint = { undercurl = true },

          DiagnosticVirtualTextError = { fg = colors.error, bg = diagnosticBg(colors.error) },
          DiagnosticVirtualTextHint = { fg = colors.hint, bg = diagnosticBg(colors.hint) },
          DiagnosticVirtualTextInfo = { fg = colors.info, bg = diagnosticBg(colors.info) },
          DiagnosticVirtualTextWarn = { fg = colors.warn, bg = diagnosticBg(colors.warn) },

          CmpItemAbbrMatch = { fg = colors.yellowDark, bold = true },
          CmpItemAbbrMatchFuzzy = { fg = colors.yellowDark, bold = true },

          FzfLuaNormal = { fg = colors.fg },
          FzfLuaBorder = { fg = colors.border },
          FzfLuaHeaderText = { fg = colors.fg },
          FzfLuaHeaderBind = { fg = colors.symbol },

          -- FzfLuaCursorLineNr = { fg = colors.yellowDark },
          -- FzfLuaBufFlagCur = { fg = colors.yellowDark },
          -- FzfLuaBufFlagAlt = { fg = colors.yellowDark },
          -- FzfLuaLiveSym = { fg = colors.yellowDark },
          -- FzfLuaTabMarker = { fg = colors.yellowDark },
        },
        palette_overrides = {
          -- fg = '#FFFFFF',
          fg = "#EEEEEE",
          bg = "#000000",
          bgFloat = "#000000",

          greenLight = "#99FFE4",
          green = "#99FFE4",
          purpleDark = "#65737E",
          purple = "#FFCFA8",
          comment = mix("#8b8b8b", "#000000", math.abs(0.94)),
        },
      })
      -- vim.cmd.colorscheme("vesper")
    end,
  },
}
