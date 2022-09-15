local status, nls = pcall(require, "null-ls")
if (not status) then return end

nls.setup({
    sources = {
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.trim_whitespace,
        nls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = '[eslint] #{m}\n(#{c})'
        }),
    },
})
