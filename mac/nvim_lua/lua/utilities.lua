local M = {}

local ocamllsp = "ocamllsp"
local lualsp = "sumneko_lua"
local tslsp = "tsserver"
local jsonls = "jsonls"
local html = "html"
local tailwindlsp = "tailwindcss"
local general_name = "general"

local State = { current_lsp_name = "" }

M.OCAML_LSP_NAME = (function() return ocamllsp end)()
M.GENERAL_NAME = (function() return general_name end)()
M.LUA_LSP_NAME = (function() return lualsp end)()
M.TS_LSP_NAME = (function() return tslsp end)()
M.JSON_LSP_NAME = (function() return jsonls end)()
M.HTML_LSP_NAME = (function() return html end)()
M.TAILWIND_LSP_NAME = (function() return tailwindlsp end)()

M.get_current_lsp_name = function()
    return State.current_lsp_name
end

M.set_current_lsp_name = function(lspname)
    State.current_lsp_name = lspname
end

M.run_dune_utop = function(root_dir, cmd)
    local ok, term = pcall(require, "toggleterm.terminal")
    if not ok then
        vim.schedule(function()
            vim.notify("toggleterm not found.", vim.log.levels.error)
        end)
        return
    else
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
end

local function spread(template)
    local result = {}
    for key, value in pairs(template) do
        result[key] = value
    end

    return function(table)
        for key, value in pairs(table) do
            result[key] = value
        end
        return result
    end
end

M.get_cmp_kinds = function()
    local cmp_kinds = {
        ["common"] = {
            Text = "",
            Keyword = "",
            Snippet = "﬌",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
            Unit = "",
        },

        [M.GENERAL_NAME] = {
            Method = "",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "ﰠ",
            Unit = "",
            Value = "",
            Enum = "",
        },

        [M.OCAML_LSP_NAME] = {
            Method = "ﬦ",
            Function = "ﬦ",
            Constructor = "ﬦ",
            Field = "ﬦ",
            Variable = "ﬦ",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "ﬦ",
            Value = "ﬦ",
            Enum = "ﬦ",
        }
    }
    local key = M.get_current_lsp_name()
    if key == "" then key = M.GENERAL_NAME end
    local k = cmp_kinds[key];
    if k == nil then k = cmp_kinds.general end
    return spread(k)(cmp_kinds.common)
end

M.get_lsp_symbol = function()
    if M.get_current_lsp_name() == M.OCAML_LSP_NAME then
        return "🐫"
    else return "𝕷"
    end

end

return M
