local status, lsp = pcall(require, "lspconfig")
if (not status) then return end

local utilities = require("utilities");

local on_attach = function(client, bufnr)
  utilities.set_current_lsp_name(client.name)

  -- enable completion triggered by <ctr-space>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "<space>k", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "gk", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>td", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>x", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
  vim.keymap.set("n", "<space>do", vim.diagnostic.open_float, bufopts)
  vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set("n", "gl", vim.diagnostic.goto_next, bufopts)
  vim.keymap.set("n", "<space>dl", vim.diagnostic.setloclist, bufopts)

  local root_dir = vim.lsp.buf.list_workspace_folders()[1]
  if client.name == utilities.OCAML_LSP_NAME then
    vim.keymap.set("n", "<C-\\>", function()
      -- vim.cmd("silent! write")
      utilities.run_dune_utop(root_dir, "dune utop")
    end, bufopts)
  end

  if client.name == utilities.TS_LSP_NAME then
    client.server_capabilities.document_formatting = false
  end

  if client.name == utilities.RUST_LS then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_sync(nil, 1000) end
    })
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end

  if client.name == utilities.RESCRIPT_LSP_NAME then
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>rd", "<Cmd>RescriptJumpToDefinition<CR>", opts)
    vim.keymap.set("n", "<leader>rf", "<Cmd>RescriptFormat<CR>", opts)
    vim.keymap.set("n", "<leader>rt", "<Cmd>RescriptTypeHint<CR>", opts)
    vim.keymap.set("n", "<leader>rb", "<Cmd>RescriptBuild<CR>", opts)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "rescript#Complete")
  end

  if client.server_capabilities.code_lens then
    local codelens = vim.api.nvim_create_augroup(
      'LSPCodeLens',
      { clear = true }
    )
    vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'CursorHold' }, {
      group = codelens,
      callback = function()
        vim.lsp.codelens.refresh()
      end,
      buffer = bufnr,
    })
  end
end

local c = vim.lsp.protocol.make_client_capabilities()
c.textDocument.completion.completionItem.snippetSupport = true
c.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}
local capabilities = require("cmp_nvim_lsp").default_capabilities(c)

lsp.ocamllsp.setup {
  settings = {
    codelens = { enable = true },
  },
}

lsp.ocamllsp.setup({
  name = utilities.OCAML_LSP_NAME,
  -- cmd = { 'esy', utilities.OCAML_LSP_NAME, "--fallback-read-dot-merlin" },
  filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
  root_dir = lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
  on_attach = on_attach,
  capabilities = capabilities
})

lsp.tsserver.setup {
  name = utilities.TS_LSP_NAME,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = { hostInfo = "neovim" },
  root_dir = lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  on_attach = on_attach,
  capabilities = capabilities
}

lsp.jsonls.setup {
  name = utilities.JSON_LSP_NAME,
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  init_options = { provideFormatter = true },
  root_dir = lsp.util.find_git_ancestor,
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities
}

lsp.html.setup {
  name = utilities.HTML_LSP_NAME,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true
    },
    provideFormatter = true
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

lsp.cssls.setup({
  name = utilities.CSSLS,
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less", "styl" },
  root_dir = lsp.util.root_pattern("package.json", ".git"),
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    },
  },
  single_file_support = true,
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.cssmodules_ls.setup({
  name = utilities.CSS_MODULE_LS,
  cmd = { "cssmodules-language-server" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_dir = lsp.util.root_pattern("package.json"),
  on_attach = on_attach,
  capabilities = capabilities,
})

lsp.tailwindcss.setup({
  name = utilities.TAILWIND_LSP_NAME,
  cmd = { "tailwindcss-language-server", "--stdio" },
  -- capabilities = c,
  capabilities = capabilities,
  filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "edge", "eelixir", "ejs", "erb",
    "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown",
    "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss",
    "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "rescriptreact", "typescript",
    "typescriptreact",
    "vue", "svelte" }
})

lsp.astro.setup {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  init_options = {
    configuration = {},
    typescript = {
      serverPath = ""
    }
  },
  root_dir = lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
}

lsp.lua_ls.setup({
  name = utilities.LUA_LSP_NAME,
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  log_level = 2,
  root_dir = lsp.util.root_pattern(".luarc.json", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", ".git"),
  single_file_support = true,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        -- library = vim.api.nvim_get_runtime_file("", true),
        library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true,[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true }
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = on_attach,
  capabilities = capabilities
})

lsp.rescriptls.setup({
  name = utilities.RESCRIPT_LSP_NAME,
  cmd = {
    "node",
    "/Users/jazz/ghq/github.com/rescript-lang/vim-rescript/server/out/server.js",
    "--stdio"
  },
  filetypes = { "rescript" },
  root_dir = lsp.util.root_pattern("bsconfig.json"),
  settings = {
  },
  on_attach = on_attach,
  capabilities = capabilities
})

lsp.kotlin_language_server.setup({
  cmd = { "kotlin-language-server" },
  filetypes = { "kotlin" },
  name = utilities.KOTLIN_LS,
  root_dir = lsp.util.root_pattern("settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts"),
  on_attach = on_attach,
  capabilities = capabilities
})

-- Diagnostic symbols in the sign column (gutter)
local signs = {
  Error = " ",
  Warn = " ",
  Info = " ",
  Hint = " "
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "●"
  },
  signs = true,
  update_in_insert = true,
  underline = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
  })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded" }
)

vim.cmd [[
    " make hover window"s background transparent
    highlight! link FloatBorder Normal
    highlight! link NormalFloat Normal
]]
