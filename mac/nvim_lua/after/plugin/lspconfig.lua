local status, lsp = pcall(require, "lspconfig")
if (not status) then return end

local utilities = require("utilities");

local on_attach = function(client, bufnr)
    utilities.set_current_lsp_name(client.name)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>x", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>td", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>a", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
    vim.keymap.set("n", "<space>do", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "gl", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "<space>dl", vim.diagnostic.setloclist, bufopts)

    local root_dir = vim.lsp.buf.list_workspace_folders()[1]
    if client.name == utilities.OCAML_LSP_NAME then
        vim.keymap.set("n", "<C-\\>", function()
            vim.api.nvim_command("silent! write")
            utilities.run_dune_utop(root_dir, "dune utop")
        end, bufopts)
    end

    if client.name == utilities.TS_LSP_NAME then
        client.resolved_capabilities.document_formatting = false
    end

    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.formatting_seq_sync() end
        })
    end
end

local c = vim.lsp.protocol.make_client_capabilities()
c.textDocument.completion.completionItem.snippetSupport = true
local capabilities = require("cmp_nvim_lsp").update_capabilities(c)

lsp.ocamllsp.setup({
    name = utilities.OCAML_LSP_NAME,
    cmd = { utilities.OCAML_LSP_NAME },
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
    root_dir = lsp.util.find_git_ancestor;
    single_file_support = true,
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
    capabilities = capabilities,
}

lsp.tailwindcss.setup({
    name = utilities.TAILWIND_LSP_NAME,
    cmd = { "tailwindcss-language-server", "--stdio" },
    capabilities = c,
})

lsp.sumneko_lua.setup({
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
                library = { [vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true }
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

-- vim.cmd [[ autocmd BufWritePre * lua vim.lsp.buf.formatting_sync() ]]
vim.cmd [[
    " make hover window"s background transparent
    highlight! link FloatBorder Normal
    highlight! link NormalFloat Normal
]]
