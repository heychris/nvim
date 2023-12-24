local ts_configs = require 'nvim-treesitter.configs'

---@diagnostic disable-next-line: missing-fields
ts_configs.setup {
  ensure_installed = {
    'bash',
    'query',
    'html',
    'javascript',
    'typescript',
    'tsx',
    'json',
    'markdown',
    'vim',
    'vimdoc',
    'lua',
    'toml',
  },

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },

  additional_vim_regex_highlighting = false,

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<C-space>',
      node_incremental = '<C-space>',
      scope_incremental = false,
      node_decremental = '<bs>',
    },
  },

  textobjects = {
    move = {
      enable = true,
      goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer' },
      goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer' },
      goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer' },
      goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer' },
    },
  },

  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = true,
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',

      -- This shows stuff like literal strings, commas, etc.
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },

  lsp_interop = {
    enable = true,
    border = 'solid',
    peek_definition_code = {
      ['<Leader>K'] = '@function.outer',
    },
  },
}

---@diagnostic disable-next-line: missing-fields
require('ts_context_commentstring').setup {
  enable_autocmd = false,

  config = {
    lua = '-- %s',
  },
}

vim.g.skip_ts_context_commentstring_module = true
