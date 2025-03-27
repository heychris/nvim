if vim.loader then
  vim.loader.enable()
end

require 'heychris.utils.globals'
require 'heychris.core.general'
require 'heychris.core.disable'
require 'heychris.core.keymaps'
require 'heychris.core.autocmds'
require 'heychris.core.plugins'
require 'heychris.core.lsp'
