local status, hop = pcall(require, "hop")
if (not status) then return end

hop.setup({
    keys = 'etovxqpdygfblzhckisuran',
    create_hl_autocmd = false,
})

vim.api.nvim_set_keymap("n", "<space>m", "<cmd>HopWord<cr>", {})
vim.api.nvim_set_keymap("n", "<space>v", "<cmd>HopVertical<cr>", {})
vim.api.nvim_set_keymap("n", "<space>n", "<cmd>HopLine<cr>", {})
