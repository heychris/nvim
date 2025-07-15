local actions = require("diffview.actions")

require("diffview").setup({
  enhanced_diff_hl = true,
  view = {
    default = {
      -- "diff1_plain"
      --     | "diff2_horizontal"
      --     | "diff2_vertical"
      --     | "diff3_horizontal"
      --     | "diff3_vertical"
      --     | "diff3_mixed"
      --     | "diff4_mixed"
      --     | -1
      layout = "diff2_horizontal",
    },
    merge_tool = {
      layout = "diff3_mixed",
      disable_diagnostics = true,
    },
  },
  default_args = {
    DiffviewOpen = { "--imply-local" },
  },
  keymaps = {
    view = {
      { "n", "q", actions.close, { desc = "Close the window" } },
      { "n", "<Tab>", actions.select_next_entry, { desc = "Jump to the next entry" } },
      { "n", "<S-Tab>", actions.select_prev_entry, { desc = "Jump to the previous entry" } },
      {
        "n",
        "gd",
        function()
          actions.goto_file_edit()
          vim.lsp.buf.definition()
        end,
        { desc = "Go to the definition of the current file" },
      },
    },
    file_history_panel = {
      { "n", "q", "<cmd>DiffviewClose<CR>", { desc = "Close the file history panel" } },
      { "n", "[n", actions.select_prev_commit, { desc = "Previous commit" } },
      { "n", "]n", actions.select_next_commit, { desc = "Next commit" } },
      { "n", "<cr>", actions.focus_entry, { desc = "Focus the selected entry" } },
    },
    file_panel = {
      { "n", "q", "<cmd>DiffviewClose<CR>" },
      { "n", "<cr>", actions.focus_entry, { desc = "Focus the selected entry" } },
      { "n", "cc", "<Cmd>Git commit <bar> wincmd J<CR>", { desc = "Commit staged changes" } },
      { "n", "ca", "<Cmd>Git commit --amend <bar> wincmd J<CR>", { desc = "Amend the last commit" } },
      { "n", "c<space>", ":Git commit ", { desc = 'Populate command line with ":Git commit "' } },
      { "n", "rr", "<Cmd>Git rebase --continue <bar> wincmd J<CR>", { desc = "Continue the current rebase" } },
      { "n", "re", "<Cmd>Git rebase --edit-todo <bar> wincmd J<CR>", { desc = "Edit the current rebase todo list." } },
      {
        "n",
        "[c",
        actions.view_windo(function(_, sym)
          if sym == "b" then
            vim.cmd("norm! [c")
          end
        end),
        { desc = "Jump to the previous conflict" },
      },
      {
        "n",
        "]c",
        actions.view_windo(function(_, sym)
          if sym == "b" then
            vim.cmd("norm! ]c")
          end
        end),
        { desc = "Jump to the next conflict" },
      },
      {
        "n",
        "do",
        actions.view_windo(function(_, sym)
          if sym == "b" then
            vim.cmd("norm! do")
          end
        end),
        { desc = "Choose the OURS version of a conflict" },
      },
      {
        "n",
        "dp",
        actions.view_windo(function(_, sym)
          if sym == "b" then
            vim.cmd("norm! dp")
          end
        end),
        { desc = "Choose the THEIRS version of a conflict" },
      },
    },
  },
})
