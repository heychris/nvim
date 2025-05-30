local React = require("heychris.utils.react")

local baseDefinitionHandler = vim.lsp.handlers["textDocument/definition"]

local servers = {
  vtsls = {
    inlay_hints = {
      enabled = true,
    },
    diagnostics = {
      virtual_text = {
        space = 4,
        source = "if_many",
        prefix = "●",
      },
    },
    handlers = {
      source_definition = function(err, result, method, ...)
        if vim.tbl_islist(result) and #result > 1 then
          local filtered_result = React.filter(result, React.filterReactDTS)
          return baseDefinitionHandler(err, filtered_result, method, ...)
        end

        baseDefinitionHandler(err, result, method, ...)
      end,
    },
    settings = {
      complete_function_calls = true,
      vtsls = {
        enableMoveToFileCodeAction = true,
        experimental = {
          completion = {
            enableServerSideFuzzyMatch = true,
          },
        },
      },
      typescript = {
        tsserver = {
          maxTsSServerMemory = 8192,
        },
        updateImportsOnFileMove = { enabled = "always" },
        suggest = {
          completeFunctionCalls = true,
        },
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterNames = { enabled = "literals" },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = { enabled = false },
        },
        preferGoToSourceDefinition = true,
      },
    },
  },
  eslint = {
    settings = {
      experimental = {},
    },
  },
}

require("mason").setup({
  ui = {
    border = "single",
  },
})

require("lspconfig.configs").vtsls = require("vtsls").lspconfig

local capabilities = vim.lsp.protocol.make_client_capabilities()

require("mason-lspconfig").setup({
  ensure_installed = vim.tbl_keys(servers),
  automatic_installation = true,
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
      server.capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities)

      require("lspconfig")[server_name].setup(server)
    end,
  },
})

--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("config-lsp-attach", { clear = true }),
  callback = function(event)
    -- NOTE: Remember that Lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")

    -- Find references for the word under your cursor.
    map("gr", require("fzf-lua").lsp_references, "[G]oto [R]eferences")

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    map("gI", require("fzf-lua").lsp_implementations, "[G]oto [I]mplementation")

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    map("<leader>D", require("fzf-lua").lsp_typedefs, "Type [D]efinition")

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    map("<leader>ds", require("fzf-lua").lsp_document_symbols, "[D]ocument [S]ymbols")

    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    map("<leader>ws", require("fzf-lua").lsp_workspace_symbols, "[W]orkspace [S]ymbols")

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map("<leader>ca", require("fzf-lua").lsp_code_actions, "[C]ode [A]ction")

    -- Opens a popup that displays documentation about the word under your cursor
    --  See `:help K` for why this keymap.
    map("K", vim.lsp.buf.hover, "Hover Documentation")

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
