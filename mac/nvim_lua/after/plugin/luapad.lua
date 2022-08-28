local status, luapad = pcall(require, "luapad")
if (not status) then return end

luapad.setup {
    count_limit = 150000,
    error_indicator = true,
    eval_on_move = false,
    split_orientation = 'horizontal',
    preview = false,
    on_init = function()
        print 'Hello from Luapad!'
    end,
    context = { foobar = "foobar" }
}

vim.keymap.set("n", "<C-l>", ":lua require(\"luapad\").init()<Cr>")
