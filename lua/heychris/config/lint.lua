local lint = require 'lint'

lint.linters_by_ft = {
  lua = { 'luacheck' },
  markdown = { 'markdownlint' },
  yaml = { 'yamllint' },
  json = { 'jsonlint' },
  vim = { 'vint' },
  go = { 'golint', 'golangcilint' },
  rust = { 'rust' },
  html = { 'htmlhint' },
  css = { 'stylelint' },
  scss = { 'stylelint' },
  ['*'] = { 'codespell' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
  group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
  callback = function()
    lint.try_lint()
  end,
})
