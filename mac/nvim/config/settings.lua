--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]


-- Theme
vim.o.termguicolors = true
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.ayucolor="dark"   
vim.cmd [[colorscheme ayu]]

