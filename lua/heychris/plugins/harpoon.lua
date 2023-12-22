return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  requires = { 'nvim-lua/plenary.nvim' },
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
}
