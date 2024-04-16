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

    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
  },

  textsubjects = {
    enable = true,
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
      ['i;'] = 'textsubjects-container-inner',
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
