return {
  {
    "mbbill/undotree",
    lazy = "VeryLazy",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
    },
  },

  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    lazy = false,
    opts = {
      columns = {
        { "mtime", highlight = "Number" },
      },
      win_options = {
        number = false,
        relativenumber = false,
        signcolumn = "no",
        foldcolumn = "0",
        statuscolumn = "",
      },
      cleanup_delay_ms = false,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = true,
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name)
          return name == ".."
        end,
      },
    },
    keys = {
      { "<leader>-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = function()
      local harpoon = require("harpoon")
      local Path = require("plenary.path")

      local path_separator = Path.path.sep

      local function normalize_path(buf_name, root)
        return Path:new(buf_name):make_relative(root)
      end

      local function maybe_path_from_git_root(path)
        local home = vim.fs.find(".git", {
          path = path,
          upward = true,
          type = "directory",
        })[1]

        if home == nil then
          return path
        end

        local trunk = table.concat({
          "/",
          vim.fn.expand("%r"),
        })

        return trunk
      end

      local function concat_filename(path, sep)
        local segments = vim.split(path, sep)
        if #segments == 0 then
          return path
        elseif #segments == 1 then
          return segments[#segments]
        elseif #segments == 2 then
          return table.concat({ "..", segments[#segments - 1], segments[#segments] }, sep)
        else
          return table.concat({ "..", segments[#segments - 2], segments[#segments - 1], segments[#segments] }, sep)
        end
      end

      harpoon:setup({
        default = {
          create_list_item = function(config, name)
            name = name or normalize_path(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), config.get_root_dir())

            local bufnr = vim.fn.bufnr(name, false)
            local pos = { 1, 0 }
            if bufnr ~= -1 then
              pos = vim.api.nvim_win_get_cursor(0)
            end

            return {
              value = vim.fn.expand("%:p"),
              context = {
                row = pos[1],
                col = pos[2],
                path = maybe_path_from_git_root(vim.fn.expand("%:p")),
              },
            }
          end,
          display = function(list_item)
            local full_path = list_item.context.path

            if not full_path then
              return list_item
            end

            local windowWidth = vim.api.nvim_win_get_width(0)
            local ui_width_ratio = 0.62569

            local truncateAt = math.floor(windowWidth * ui_width_ratio)

            if string.len(full_path) >= truncateAt then
              return concat_filename(full_path, path_separator)
            end

            return full_path
          end,
        },
        settings = {
          save_on_toggle = true,
        },
      })

      return {
        {
          "<leader>a",
          function()
            harpoon:list():add()
          end,
        },
        {
          "<C-e>",
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
        },
        {
          "<C-h>",
          function()
            harpoon:list():select(1)
          end,
        },
        {
          "<C-j>",
          function()
            harpoon:list():select(2)
          end,
        },
        {
          "<C-n>",
          function()
            harpoon:list():select(3)
          end,
        },
        {
          "<C-m>",
          function()
            harpoon:list():select(4)
          end,
        },
      }
    end,
  },

  {
    "ibhagwan/fzf-lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      { "junegunn/fzf", build = "./install --bin" },
    },
    config = function()
      require("heychris.config.fzf")
    end,
  },

  "tpope/vim-surround",
}
