local dap = require("dap")
local ui = require("dapui")

-- Setup
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
require("mason-nvim-dap").setup({
  automatic_installation = true,
  handles = {},
  ensure_installed = { "chrome", "node2" },
})

local languages = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

-- Config
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "js-debug-adapter",
    args = { "${port}" },
  },
}

dap.adapters["pwa-chrome"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "js-debug-adapter",
    args = { "${port}" },
  },
}

vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

local vscode = require("dap.ext.vscode")
local _filetypes = require("mason-nvim-dap.mappings.filetypes")
local filetypes = vim.tbl_deep_extend("force", _filetypes, {
  ["node"] = languages,
  ["pwa-node"] = languages,
  ["chrome"] = languages,
  ["pwa-chrome"] = languages,
})

local json = require("plenary.json")
vscode.json_decode = function(str)
  return vim.json.decode(json.json_strip_comments(str))
end
vscode.load_launchjs(nil, filetypes)

for _, language in ipairs(languages) do
  vim.list_extend(dap.configurations[language], {
    -- {
    --   type = 'pwa-node',
    --   request = 'launch',
    --   name = 'Launch JS file',
    --   program = '${file}',
    --   cwd = '${workspaceFolder}',
    -- },
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      cwd = "${workspaceFolder}",
      -- NOTE: you would need to have tsx installed globally
      runtimeExecutable = "tsx",
      args = { "${file}" },
      sourceMaps = true,
      protocol = "inspector",
      skipFiles = { "<node_internals>/**", "node_modules/**" },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to process",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Start Chrome on port",
      url = function()
        local port = vim.fn.input({
          prompt = "Port ",
          completion = "file",
        })
        return "http://localhost:3000" .. port
      end,
      webRoot = "${workspaceFolder}",
      userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
    },
  })
end

-- Keymaps
vim.keymap.set("n", "<space>du", ui.toggle)
vim.keymap.set("n", "<space>de", ui.eval)

vim.keymap.set("n", "<space>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<space>dc", dap.continue)
vim.keymap.set("n", "<space>di", dap.step_into)
vim.keymap.set("n", "<space>dO", dap.step_over)
vim.keymap.set("n", "<space>do", dap.step_out)
vim.keymap.set("n", "<space>dr", dap.restart)
vim.keymap.set("n", "<space>dt", dap.terminate)
vim.keymap.set("n", "<space>dw", function()
  require("dap.ui.widgets").hover()
end)

dap.listeners.before.attach.dapui_config = function()
  ui.open()
end
dap.listeners.before.launch.dapui_config = function()
  ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  ui.close()
end
