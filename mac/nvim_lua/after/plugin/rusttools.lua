local status, rt = pcall(require, "rust-tools")
if (not status) then return end

local utilities = require("utilities");

local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.4/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

rt.setup({
    tools = {
        on_initialized = function()
            vim.cmd [[
            autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
          ]]
        end,
    },
    server = {
        standalone = true,
        on_attach = function(client, bufnr)
            utilities.set_current_lsp_name(client.name)
            vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, { buffer = bufnr })
            vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = bufnr })
        end,
        settings = {
            ["rust-analyzer"] = {
                lens = {
                    enable = true,
                },
                checkOnSave = {
                    command = "clippy"
                }
            }
        }
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    },
})


vim.keymap.set("n", "<F5>", "<Cmd>RustRun<CR>")
