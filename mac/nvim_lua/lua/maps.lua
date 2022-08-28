local keymap = vim.keymap

--*********** editing Text **********--
-- delete text with 'x' without changing the internal register
keymap.set({ 'n', 'x' }, 'x', '"_x')

-- select all
keymap.set("n", "<C-a>", ":keepjumps normal! ggVG<cr>")

-- save with ctrl + s  test
keymap.set("n", "<C-s>", "<C-c>:update<CR>")
keymap.set("v", "<C-s>", "<C-c>:update<CR>")
keymap.set("i", "<C-s>", "<C-o>:update<CR>")

-- By pressing ctrl+r in visual mode, you will be prompted to enter text to replace with.
-- Press enter and then confirm each change you agree with y or decline with n.
keymap.set("v", "<C-r>", "hy:%s/<C-r>h//gc<left><left><left>")

-- insert a new line without leaving normal mode
keymap.set("n", "<leader>no", "o<Esc>3\"_D")
keymap.set("n", "<leader>nO", "O<Esc>3\"_D")

-- indent all
keymap.set("n", "<C-]>", ":keepjumps normal! gg=G<Cr>")

-- move text up and down
keymap.set("n", "<A-j>", "<Esc>:m .+1<CR>==")
keymap.set("n", "<A-k>", "<Esc>:m .-2<CR>==")

--*********** buffer **********--
-- a new buffer
keymap.set("n", "<leader>new", ":new<cr>")

-- close the current buffer and move to the previous one
keymap.set("n", "<leader>bq", ":bp <bar> bd #<cr>")

--*********** windows **********--
-- navigate windows
keymap.set("n", "<leader>h", "<c-w><c-h>")
keymap.set("n", "<leader>j", "<c-w><c-j>")
keymap.set("n", "<leader>k", "<c-w><c-k>")
keymap.set("n", "<leader>l", "<c-w><c-l>")

-- split windows
keymap.set("n", ",h", ":split<cr>")
keymap.set("n", ",v", ":vsplit<cr>")

-- resize windows
keymap.set("n", "<leader><Right>", ":vertical resize +8<CR>")
keymap.set("n", "<leader><Left>", ":vertical resize -2<CR>")
keymap.set("n", "<leader><Up>", ":resize +8<CR>")
keymap.set("n", "<leader><Down>", ":resize -2<CR>")

-- navigate buffers
keymap.set("n", "<S-l>", ":bnext<CR>")
keymap.set("n", "<S-h>", ":bprevious<CR>")

--*********** misc **********--
-- go into normal mode by pressing jk instead of escape key
keymap.set("i", "jk", "<esc>")

-- reload config without closing and reopening nvim
keymap.set("n", "<C-s><C-o>", ":so%<CR>")

-- remove all trailing whitespace by pressing F5
keymap.set("n", "<C-c><C-c>", [[:let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>]])
