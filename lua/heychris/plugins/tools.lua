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
    lazy = false,
    opts = {
      columns = {
        { 'mtime', highlight = 'Number' },
      },
      win_options = {
        number = false,
        relativenumber = false,
        signcolumn = 'no',
        foldcolumn = '0',
        statuscolumn = '',
      },
      cleanup_delay_ms = false,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = true,
      view_options = {
        is_always_hidden = function(name)
          return name == '..'
        end,
      },
    },
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
      'nvim-telescope/telescope-ui-select.nvim',
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
