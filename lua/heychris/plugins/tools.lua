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
            harpoon:list():add()
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

  {
    'ibhagwan/fzf-lua',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      { 'junegunn/fzf', build = './install --bin' },
    },
    config = function()
      require 'heychris.config.fzf'
    end,
  },
}
