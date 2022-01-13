let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-cssmodules', 'coc-diagnostic', 'coc-dot-complete', 'coc-eslint', 'coc-flow', 'coc-fzf-preview', 'coc-html', 'coc-highlight', 'coc-html-css-support', 'coc-json', 'coc-lightbulb', 'coc-markdown-preview-enhanced', 'coc-prettier', 'coc-snippets', 'coc-sql', 'coc-svg', 'coc-toml', 'coc-xml', 'coc-yaml', 'coc-svelte', 'coc-lists']

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=yes
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> gl <Plug>(coc-diagnostic-next)
nmap <silent> gh <Plug>(coc-diagnostic-prev)
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Run the Code Lens action on the current line.
nmap ;ca  <Plug>(coc-codelens-action)

" Symbol renaming.
nmap ;rn <Plug>(coc-rename)
" Ad `:Format` command to format current buffer.
command! -nargs=0 Fmt :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fl :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> ;a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> ;x  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> ;m  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> ;o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> ;s  :<C-u>CocList -I -N --top symbols<cr>
" Resume latest coc list.
nnoremap <silent><nowait> ;l  :<C-u>CocList<CR>

" coc-css scss
autocmd FileType scss setl iskeyword+=@-@
" To get correct comment highlighting in coc-settings.json
autocmd FileType json syntax match Comment +\/\/.\+$+

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif
