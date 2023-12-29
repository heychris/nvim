local lint = require 'lint'

lint.linters_by_ft = {
  lua = { 'luacheck' },
  sh = { 'shellcheck' },
  markdown = { 'markdownlint' },
  yaml = { 'yamllint' },
  json = { 'jsonlint' },
  vim = { 'vint' },
  go = { 'golint', 'golangcilint' },
  rust = { 'rust' },
  html = { 'htmllint' },
  css = { 'stylelint' },
  scss = { 'stylelint' },
}

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
  callback = function()
    lint.try_lint()
  end,
})
