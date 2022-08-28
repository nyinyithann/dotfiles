local status, rt = pcall(require, "rust-tools")
if (not status) then return end

local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.4/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
local rustlsp = "rust_analyzer"

rt.setup({
    server = {
        -- root_dir = require("lspconfig.util").root_pattern("Cargo.toml", "rust-project.json", ".git"),
        -- name = rustlsp,
        -- cmd = { "rust-analyzer" },
        standalone = true,
        -- filetypes = { "rust" },
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy"
            }
        }
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    },
})
