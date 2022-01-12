" Hooking up the ReScript autocomplete function
set omnifunc=rescript#Complete

" When preview is enabled, omnicomplete will display additional
" information for a selected item
set completeopt+=preview

" Note that <buffer> allows us to use different commands with the same keybindings depending
" on the filetype. This is useful if to override your e.g. ALE bindings while working on
" ReScript projects.
autocmd FileType rescript nnoremap <silent> <buffer> <leader>af :RescriptFormat<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <leader>at :RescriptTypeHint<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <leader>ab :RescriptBuild<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <leader>ad :RescriptJumpToDefinition<CR>
