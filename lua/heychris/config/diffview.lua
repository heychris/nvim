local actions = require 'diffview.actions'

require('diffview').setup {
  enhanced_diff_hl = true,
  view = {
    default = {
      -- "diff1_plain"
      --     | "diff2_horizontal"
      --     | "diff2_vertical"
      --     | "diff3_horizontal"
      --     | "diff3_vertical"
      --     | "diff3_mixed"
      --     | "diff4_mixed"
      --     | -1
      layout = 'diff2_horizontal',
    },
    merge_tool = {
      layout = 'diff4_mixed',
      disable_diagnostics = true,
    },
  },
  keymaps = {
    view = {
      { 'n', 'q', actions.close },
      { 'n', '<Tab>', actions.select_next_entry },
      { 'n', '<S-Tab>', actions.select_prev_entry },
    },
    file_history_panel = {
      { 'n', 'q', '<cmd>DiffviewClose<CR>' },
    },
  },
}
