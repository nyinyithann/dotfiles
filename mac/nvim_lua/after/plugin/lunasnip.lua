local status, _ = pcall(require, "luasnip")
if (not status) then return end


-- luasnip.loaders.from_vscode.lazy_load()

require("luasnip.loaders.from_vscode").lazy_load()
