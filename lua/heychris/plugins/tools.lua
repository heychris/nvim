return {
  {
    'mbbill/undotree',
    lazy = 'VeryLazy',
    keys = {
      { '<leader>u', vim.cmd.UndotreeToggle, desc = 'Toggle undotree' },
    },
  },

  {
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
  },

  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      require 'heychris.config.telescope'
    end,
  },

  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = function()
      local harpoon = require 'harpoon'

      harpoon:setup {
        settings = {
          save_on_toggle = true,
        },
      }

      return {
        {
          '<leader>a',
          function()
            harpoon:list():append()
          end,
        },
        {
          '<C-e>',
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
        },
        {
          '<C-h>',
          function()
            harpoon:list():select(1)
          end,
        },
        {
          '<C-j>',
          function()
            harpoon:list():select(2)
          end,
        },
        {
          '<C-n>',
          function()
            harpoon:list():select(3)
          end,
        },
        {
          '<C-m>',
          function()
            harpoon:list():select(4)
          end,
        },
      }
    end,
  },
}
