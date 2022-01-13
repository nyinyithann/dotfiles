" Hooking up the ReScript autocomplete function
set omnifunc=rescript#Complete

" When preview is enabled, omnicomplete will display additional
" information for a selected item
set completeopt+=preview

" Note that <buffer> allows us to use different commands with the same keybindings depending
" on the filetype. This is useful if to override your e.g. ALE bindings while working on
" ReScript projects.
autocmd FileType rescript nnoremap <silent> <buffer> rf :RescriptFormat<CR>
autocmd FileType rescript nnoremap <silent> <buffer> rt :RescriptTypeHint<CR>
autocmd FileType rescript nnoremap <silent> <buffer> rb :RescriptBuild<CR>
autocmd FileType rescript nnoremap <silent> <buffer> rd :RescriptJumpToDefinition<CR>
