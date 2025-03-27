-- See `:help gitsigns.txt`
require("gitsigns").setup({
  preview_config = {
    border = "solid",
    style = "minimal",
  },
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 3000,
  },
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    -- Navigation
    vim.keymap.set({ "n", "v" }, "]c", function()
      if vim.wo.diff then
        return "]c"
      end
      vim.schedule(function()
        gs.next_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, buffer = bufnr, desc = "Jump to next hunk" })

    vim.keymap.set({ "n", "v" }, "[c", function()
      if vim.wo.diff then
        return "[c"
      end
      vim.schedule(function()
        gs.prev_hunk()
      end)
      return "<Ignore>"
    end, { expr = true, buffer = bufnr, desc = "Jump to previous hunk" })

    -- Actions
    vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Git [h]unk [s]stage" })
    vim.keymap.set("v", "<leader>hs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Git [h]unk [s]stage" })

    vim.keymap.set("n", "<leader>hr", gs.reset_hunk)
    vim.keymap.set("v", "<leader>hr", function()
      gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, { desc = "Git [h]unk [r]eset" })

    vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { desc = "Git [h]unk [S]tage buffer" })
    vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Git [h]unk [u]ndo stage" })
    vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { desc = "Git [h]unk [R]eset buffer" })
    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Git [h]unk [p]review" })
    vim.keymap.set("n", "<leader>hb", function()
      gs.blame_line({ full = true })
    end, { desc = "Git [h]unk [b]lame" })
    vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle [t]oggle [b]lame" })
    vim.keymap.set("n", "<leader>hd", gs.diffthis, { desc = "Git [h]unk [d]iff" })
    vim.keymap.set("n", "<leader>hD", function()
      gs.diffthis("~")
    end, { desc = "Git [h]unk [D]iff (against HEAD)" })
    vim.keymap.set("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle [t]oggle [d]eleted" })

    -- Text object
    vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { buffer = bufnr, desc = "Select git hunk" })
  end,
})
