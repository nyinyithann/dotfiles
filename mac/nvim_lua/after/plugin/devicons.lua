local status_ok, wdicons = pcall(require, "nvim-web-devicons")
if not status_ok then
    return
end

wdicons.setup {
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
        },
        rescript = {
            icon = "λ",
            color = "#89e051",
            cterm_color = "113",
            name = "Rescript",
        },
    }
}
