return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      completion = {
        accept = {
          -- experimental auto-brackets support
          auto_brackets = { enabled = true },
        },
        menu = {
          draw = {
            treesitter = { 'lsp' },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
        ghost_text = {
          enabled = true,
        },
      },

      signature = {
        enabled = true,
      },
    },
  },
}
