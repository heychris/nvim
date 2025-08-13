-- [[ Set colorscheme ]]

-- Background
vim.api.nvim_set_hl(0, "Normal", { bg = "#060608" })

-- Floats
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Comment" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuSel", { link = "Comment" })

-- Status line
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })

-- Line numbers
vim.api.nvim_set_hl(0, "LineNr", { link = "Comment" })
vim.api.nvim_set_hl(0, "CursorLineNr", { link = "Normal" })

-- [[ Set UI options  ]]

-- Window border
vim.o.winborder = "rounded"

-- Diagnostic format
vim.diagnostic.config({
  severity_sort = true,
  virtual_text = {
    space = 4,
    prefix = "",
    format = function(diagnostic)
      return string.format("● [%s] %s", diagnostic.source, diagnostic.message)
    end,
  },
})
