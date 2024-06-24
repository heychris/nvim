local fzf = require 'fzf-lua'
local utils = fzf.utils
local actions = fzf.actions

local function hl_validate(hl)
  return not utils.is_hl_cleared(hl) and hl or nil
end

fzf.setup {
  { 'default-title' }, -- base profile
  desc = 'custom telescope based profile',
  fzf_opts = {
    ['--layout'] = 'reverse',
    ['--marker'] = '+',
    ['--margin'] = '1',
  },
  winopts = {
    width = 0.8,
    height = 0.9,
    preview = {
      hidden = 'nohidden',
      vertical = 'up:50%',
      -- horizontal = 'right:50%',
      layout = 'vertical',
      flip_columns = 120,
      delay = 10,
      winopts = { number = false },
    },
  },
  hls = {
    normal = hl_validate 'TelescopeNormal',
    title = hl_validate 'TelescopePromptTitle',
    help_normal = hl_validate 'TelescopeNormal',
    help_border = hl_validate 'TelescopeBorder',
    preview_normal = hl_validate 'TelescopeNormal',
    preview_border = hl_validate 'TelescopeBorder',
    preview_title = hl_validate 'TelescopePreviewTitle',
    -- builtin preview only
    -- cursor = hl_validate 'Cursor',
    -- cursorline = hl_validate 'TelescopeSelection',
    -- cursorlinenr = hl_validate 'TelescopeSelection',
    -- search = hl_validate 'IncSearch',
  },
  fzf_colors = {
    ['bg'] = { 'bg', 'TelescopeNormal' },
    ['hl'] = { 'fg', 'TelescopeMatching' },
    ['fg+'] = { 'fg', 'TelescopeSelection' },
    ['bg+'] = { 'bg', 'TelescopeSelection' },
    ['hl+'] = { 'fg', 'TelescopeMatching' },
    ['info'] = { 'fg', 'TelescopeMultiSelection' },
    ['gutter'] = '-1',
    ['query'] = { 'fg', 'TelescopePromptNormal' },
    ['prompt'] = { 'fg', 'TelescopePromptPrefix' },
    ['pointer'] = { 'fg', 'TelescopeSelectionCaret' },
    -- ['pointer'] = { 'fg', 'TelescopeSelectionCaret' },
    -- ['marker'] = { 'fg', 'TelescopeSelectionCaret' },
    ['header'] = { 'fg', 'TelescopeTitle' },
  },
  keymap = {
    builtin = {
      ['<F1>'] = 'toggle-help',
      ['<F2>'] = 'toggle-fullscreen',
      -- Only valid with the 'builtin' previewer
      ['<F3>'] = 'toggle-preview-wrap',
      ['<F4>'] = 'toggle-preview',
      ['<F5>'] = 'toggle-preview-ccw',
      ['<F6>'] = 'toggle-preview-cw',
      ['<C-d>'] = 'preview-page-down',
      ['<C-u>'] = 'preview-page-up',
      ['<S-left>'] = 'preview-page-reset',
    },
    fzf = {
      ['ctrl-z'] = 'abort',
      ['ctrl-f'] = 'half-page-down',
      ['ctrl-b'] = 'half-page-up',
      ['ctrl-a'] = 'beginning-of-line',
      ['ctrl-e'] = 'end-of-line',
      ['alt-a'] = 'toggle-all',
      -- Only valid with fzf previewers (bat/cat/git/etc)
      ['f3'] = 'toggle-preview-wrap',
      ['f4'] = 'toggle-preview',
      ['ctrl-d'] = 'preview-page-down',
      ['ctrl-u'] = 'preview-page-up',
      ['ctrl-q'] = 'select-all+accept',
    },
  },
  actions = {
    files = {
      ['default'] = actions.file_edit_or_qf,
      ['ctrl-x'] = actions.file_split,
      ['ctrl-v'] = actions.file_vsplit,
      ['ctrl-t'] = actions.file_tabedit,
      ['alt-q'] = actions.file_sel_to_qf,
      ['alt-l'] = actions.file_sel_to_ll,
    },
    buffers = {
      ['default'] = actions.buf_edit,
      ['ctrl-x'] = actions.buf_split,
      ['ctrl-v'] = actions.buf_vsplit,
      ['ctrl-t'] = actions.buf_tabedit,
    },
  },
  buffers = {
    keymap = { builtin = { ['<C-d>'] = false } },
    actions = { ['ctrl-x'] = false, ['ctrl-d'] = { actions.buf_del, actions.resume } },
  },
  defaults = {
    color_icons = false,
    git_icons = false,
  },
}

-- Disable for now until I can figure out how to search newly created files
-- vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search Git Files' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
-- vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
-- vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>ff', fzf.files, { desc = '[F]ind [F]iles' })
-- vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fg', fzf.live_grep_glob, { desc = '[F]ind by [G]rep [G]lob' })
vim.keymap.set('n', '<leader>fw', fzf.grep_cword, { desc = '[F]ind by Current [W]ord' })
vim.keymap.set('n', '<leader>fr', fzf.resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>f.', fzf.builtin, { desc = '[F]ind builtin' })
