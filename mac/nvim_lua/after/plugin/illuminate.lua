local status, illuminate = pcall(require, "illuminate")
if (not status) then return end

illuminate.configure({
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    -- delay: delay in milliseconds
    delay = 50,
    modes_allowlist = { "n", "v" },
    under_cursor = false,
})

vim.keymap.set("n", ",it", "<Cmd>IlluminateToggle<CR>", {})
