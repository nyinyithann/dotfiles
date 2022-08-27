local status, nvimwin = pcall(require, "nvim-window")
if (not status) then return end

nvimwin.setup({
    -- The characters available for hinting windows.
    chars = {
        'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
        'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
    },

    -- A group to use for overwriting the Normal highlight group in the floating
    -- window. This can be used to change the background color.
    normal_hl = "Bg",

    -- The highlight group to apply to the line that contains the hint characters.
    -- This is used to make them stand out more.
    hint_hl = 'Bold',

    -- The border style to use for the floating window.
    border = 'none'
})

vim.cmd [[ hi Bg guifg=#542c02 guibg=#b9ef32 ]]

vim.keymap.set("n", "<leader>w", ":lua require(\'nvim-window\').pick()<CR>")
