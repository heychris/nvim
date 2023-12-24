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
  keys = {
    { '<leader>-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
  },
  lazy = false,
}