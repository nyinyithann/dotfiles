local status, toggleterm = pcall(require, "toggleterm")
if (not status) then return end

toggleterm.setup({
    open_mapping = [[\\]],
    insert_mappings = true,
    terminal_mappings = true,
    direction = "horizontal",
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    float_opts = {
        border = "single",
        width = function(term)
            if term.direction == "horizontal" then
                return 20
            elseif term.direction == "vertical" then
                return vim.o.columns * 0.8
            end
        end,
        height = 30,
        winblend = 3
    },
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
})

function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<leader>h', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<leader>j', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<leader>k', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<leader>l', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- local Terminal  = require('toggleterm.terminal').Terminal
-- local utop = Terminal:new({ cmd = "utop", hidden = true, direction = "tab" })
--
-- function _utop_toggle()
--     utop:toggle()
-- end
-- vim.keymap.set("v", "<leader>'", "<Cmd>ToggleTermSendVisualSelection<CR>", { noremap = true, silent = true }) -- not working properly
-- vim.keymap.set("n", "<C-l>", "<Cmd>ToggleTermSendCurrentLine<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-\\>", "<Cmd>lua _utop_toggle()<CR>", {noremap = true, silent = true})
