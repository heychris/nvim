vim.api.nvim_create_user_command('Format', function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ['end'] = { args.line2, end_line:len() },
    }
  end

  require('conform').format { async = true, lsp_fallback = true, range = range }
end, { range = true })

vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

require('conform').setup {
  -- log_level = vim.log.levels.DEBUG,
  notify_on_error = false,

  -- The options you set here will be merged with the builtin formatters.
  formatters = {
    injected = { options = { ignore_errors = true } },
    black = {
      prepend_args = { '--fast' },
    },
  },

  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    typescript = { 'prettierd' },
    typescriptreact = { 'prettierd' },
    python = { 'isort', 'black' },
  },

  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end

    return { timeout_ms = 3000, lsp_format = 'fallback', async = false }
  end,
}
