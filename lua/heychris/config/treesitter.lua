local languages = {
  "bash",
  "query",
  "html",
  "javascript",
  "typescript",
  "tsx",
  "json",
  "markdown",
  "vim",
  "vimdoc",
  "lua",
  "toml",
}

require("nvim-treesitter").install(languages)

local filetypes = {}
for _, lang in ipairs(languages) do
  for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
    table.insert(filetypes, ft)
  end
end

local gr = vim.api.nvim_create_augroup("custom-config", {})

vim.api.nvim_create_autocmd("FileType", {
  group = gr,
  pattern = filetypes,
  callback = function(ev)
    vim.treesitter.start(ev.buf)
  end,
  desc = "Start tree-sitter",
})
