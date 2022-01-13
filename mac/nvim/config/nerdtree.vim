nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>
let NERDTreeMinimalUI=1 " remove top help line
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeDirArrows = 1
autocmd VimEnter * NERDTree
autocmd BufWinEnter * silent NERDTreeMirror     " Open the existing NERDTree on each new tab.
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
