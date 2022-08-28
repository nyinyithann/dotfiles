local status, lsp = pcall(require, "lspconfig")
if (not status) then return end

local ocamllsp = "ocamllsp"

local run_program = function(root_dir, cmd)
    local ok, term = pcall(require, "toggleterm.terminal")
    if not ok then
        vim.schedule(function()
            vim.notify("toggleterm not found.", vim.log.levels.error)
        end)
        return
    end

    term.Terminal:new({
        dir = root_dir,
        cmd = cmd,
        direction = "horizontal",
        hidden = true,
        close_on_exit = false,
        on_open = function(t)
            vim.api.nvim_feedkeys(
                vim.api.nvim_replace_termcodes([[<C-\><C-n>]], true, true, true),
                "",
                true
            )
            vim.api.nvim_buf_set_keymap(
                t.bufnr,
                "n",
                "q",
                "<cmd>close<cr>",
                { noremap = true, silent = true }
            )
        end,
    }):toggle()
end

local on_attach = function(client, bufnr)
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
    if client.name == ocamllsp then
        vim.keymap.set("n", "<C-\\>", function()
            vim.api.nvim_command("silent! write")
            run_program(root_dir, "dune utop")
        end, bufopts)
    end

end

local capabilities = require("cmp_nvim_lsp").update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

lsp.ocamllsp.setup({
    name = ocamllsp,
    cmd = { "ocamllsp" },
    filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
    root_dir = lsp.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
    on_attach = on_attach,
    capabilities = capabilities
})

lsp.sumneko_lua.setup({
    name = "sumneko_lua",
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

vim.cmd [[ autocmd BufWritePre * lua vim.lsp.buf.formatting_sync() ]]
vim.cmd [[
    " make hover window"s background transparent
    highlight! link FloatBorder Normal
    highlight! link NormalFloat Normal
]]