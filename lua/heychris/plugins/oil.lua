return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  opts = {
    columns = {
      'icon',
    },
    view_options = {
      show_hidden = true,
    },
    skip_confirm_for_simple_edits = true,
  },
  init = function() -- Load oil on startup only when editing a directory
    vim.g.loaded_fzf_file_explorer = 1
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.api.nvim_create_autocmd('BufEnter', {
      nested = true,
      group = vim.api.nvim_create_augroup('OilInit', {}),
      callback = function(info)
        local path = info.file
        if path == '' then
          return
        end
        -- Workaround for path with trailing `..`
        if path:match '%.%.$' then
          path = vim.fs.dirname(vim.fs.dirname(path) or '')
          if not path or path == '' then
            return
          end
        end
        local stat = vim.uv.fs_stat(path)
        if stat and stat.type == 'directory' then
          vim.api.nvim_exec_autocmds('UIEnter', {})
          pcall(require('oil').open, path)
          return true
        end
      end,
    })
  end,
  keys = {
    { '<leader>-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
  },
}
