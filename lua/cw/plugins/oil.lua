return {
  'stevearc/oil.nvim',
  opts = {
    columns = {
      'icon',
    },
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    { '<leader>-', '<CMD>Oil<CR>', desc = 'Open parent directory' },
  },
  lazy = false,
  -- Optional dependencies
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },
}
