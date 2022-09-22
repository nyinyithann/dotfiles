local augroup = vim.api.nvim_create_augroup("user_cmds", { clear = true })

-- press q to close help or man window
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "man", "qf", "lspinfo" },
    group = augroup,
    desc = "Use q to close the window",
    command = "nnoremap <buffer> q <cmd>quit<cr>"
})

-- highligh when yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup,
    desc = "Highlight on yank",
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
    end
})

vim.cmd [[
 " equalalize split views
 augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  autocmd! BufRead,BufNewFile *.els setfiletype json
  autocmd! BufRead,BufNewFile *.swcrc setfiletype json
  
  " if elasticsearch file, turn off diagnostics
  autocmd! BufReadPost,BufNewFile *.es :lua require 'toggle_lsp_diagnostics'.turn_off_buffer_diagnostics()
]]
