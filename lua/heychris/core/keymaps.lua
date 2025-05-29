-- [[ Basic Keymaps ]]
-- Keymaps for better default experience

-- Bubble move line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Collapse line
vim.keymap.set("n", "J", "mzJ`z")

-- Move half page and center line
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Next/Previous of last search item
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete without storing
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Find and replace word under cursor in the current line
vim.keymap.set("n", "<leader>s", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gi<Left><Left><Left>]])
-- Find and replace word under cursor in the whole file
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Close all floating windows
vim.keymap.set("n", "q", function()
  local count = 0
  local current_win = vim.api.nvim_get_current_win()
  -- close current win only if it's a floating window
  if vim.api.nvim_win_get_config(current_win).relative ~= "" then
    vim.api.nvim_win_close(current_win, true)
    return
  end
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_is_valid(win) then
      local config = vim.api.nvim_win_get_config(win)
      -- close floating windows that can be focused
      if config.relative ~= "" and config.focusable then
        vim.api.nvim_win_close(win, false) -- do not force
        count = count + 1
      end
    end
  end
  if count == 0 then -- Fallback
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("q", true, true, true), "n", false)
  end
end)

local comment = require("vim._comment")
vim.keymap.set("x", "ic", comment.textobject)
vim.keymap.set("o", "ic", comment.textobject)
