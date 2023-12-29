local lint = require 'lint'

lint.linters_by_ft = {
  javascript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescript = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
  vue = { 'eslint_d' },
  svelte = { 'eslint_d' },
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
