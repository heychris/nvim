-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = FindGitRoot()

  if git_root then
    require('telescope.builtin').live_grep {
      search_dirs = { git_root },
    }
  end
end

vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

local telescope = require 'telescope'

telescope.setup {
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {
        layout_config = {
          height = 20,
        },
      },
    },
  },
  defaults = {
    color_devicons = false,
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

telescope.load_extension 'ui-select'
telescope.load_extension 'fzf'

-- See `:help telescope.builtin`
local builtin = require 'telescope.builtin'

-- Disable for now until I can figure out how to search newly created files
-- vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search Git Files' })
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind by Current [W]ord' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })

vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
