autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType css setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType javascript setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType typescript setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType json setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType lua setlocal ts=2 sw=2 sts=2 expandtab
autocmd FileType apache setlocal commentstring=#\ %s

" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md
