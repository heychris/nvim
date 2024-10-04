local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match '^%s*$' == nil
end

-- [[ Configure LuaSnip ]]
-- See `:help luasnip`
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()

luasnip.setup {
  keep_roots = true,
  link_roots = false,
  link_children = true,
  region_check_events = 'CursorMoved,CursorMovedI',
  delete_check_events = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
  store_selection_keys = '<Tab>',
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'

vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })

-- @diagnostic disable missing-fields
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  preselect = cmp.PreselectMode.None,
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-y>'] = cmp.mapping.confirm { select = true },
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<C-e>'] = cmp.mapping.abort(),
  },
  formatting = {
    expandable_indicator = true,
    fields = { 'abbr', 'kind', 'menu' },
    format = function(entry, cmp_item)
      cmp_item.kind = string.format('%s', cmp_item.kind)

      cmp_item.menu = ({
        nvim_lsp = '[LSP]',
        nvim_lsp_signature_help = '[LSP Sig]',
        nvim_lua = '[Lua]',
        luasnip = '[LuaSnip]',
        path = '[Path]',
        buffer = '[Buffer]',
        spell = '[Spell]',
        emoji = '[Emoji]',
        calc = '[Calc]',
        -- copilot = '[Copilot]',
      })[entry.source.name]

      return cmp_item
    end,
  },
  sources = {
    { name = 'luasnip', max_item_count = 3 },
    { name = 'nvim_lsp_signature_help' },
    -- { name = 'copilot' },
    { name = 'nvim_lsp', max_item_count = 20 },
    { name = 'path' },
    { name = 'calc' },
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      -- require('copilot_cmp.comparators').prioritize,

      -- Below is the default comparitor list and order for nvim-cmp
      cmp.config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  experimental = {
    ghost_text = {
      hl_group = 'CmpGhostText',
    },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
}
