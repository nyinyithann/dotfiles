local status, whichkey = pcall(require, "which-key")
if (not status) then return end

whichkey.setup {
    window = {
        border = "single",
        position = "bottom"
    },
    triggers = { "<C-w>" },
    whichkey.register({
        f = {
            name = "file",
            f = { "<cmd>Telescope find_files<cr>", "Find File" }
        },
    }, { prefix = "<leader>" })
}
