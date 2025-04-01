-- [[ Set <space> as the leader key ]]
-- See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Setting options ]]
-- See `:help vim.opt`
vim.opt.showmode = false
vim.opt.hlsearch = false

vim.opt.scrolloff = 8

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.wo.signcolumn = "yes"

vim.opt.cursorline = true
vim.opt.colorcolumn = "80"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.completeopt = "menuone,noselect"

vim.opt.termguicolors = true

vim.opt.pumheight = 16

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",
  trail = "·",
  nbsp = "␣",
}
vim.opt.fillchars = {
  fold = "·",
  foldsep = " ",
  eob = " ",
  foldopen = "",
  foldclose = "",
  diff = "╱",
}

vim.opt.diffopt:append("algorithm:histogram")

vim.o.winborder = "rounded"

vim.diagnostic.config({
  virtual_text = {
    space = 4,
    prefix = "",
    format = function(diagnostic)
      return string.format("● [%s] %s", diagnostic.source, diagnostic.message)
    end,
  },
})
