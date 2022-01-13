" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb"_d

" Save with root permission
command! W w !sudo tee > /dev/null %

" Split window
nnoremap ,h :split<CR>
nnoremap ,v :vsplit<CR>

" map space as leader
nnoremap <SPACE> <Nop>
nmap <Space> <Leader>
" map jk to esc
inoremap <nowait> jk <esc>
" save with ctrl + s
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" To open a new empty buffer
nmap <leader>T :new<cr>

" Move to the next buffer
nmap <leader>bn :bnext<CR>

" Move to the previous buffer
nmap <leader>bp :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" BufOnly
command! BufOnly silent! execute "%bd|e#|bd#"

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" select all 
nnoremap <silent> <C-a> ggVG

" By pressing ctrl+r in visual mode, you will be prompted to enter text to replace with. 
" Press enter and then confirm each change you agree with y or decline with n.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Cursorline color 
" Visual Mode Orange Background, Black Text
hi Visual guifg=#000000 guibg=#323D3E

" Default Colors for CursorLine
highlight CursorLine guibg=#3E3D32
highlight Cursor guibg=#A6E22E;

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLine guibg=#323D3E
autocmd InsertEnter * highlight  Cursor guibg=#00AAFF;

" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLine guibg=#3E3D32
autocmd InsertLeave * highlight  Cursor guibg=#A6E22E;

" Resize 
nnoremap <leader><Right> :vertical resize +5<CR>
nnoremap <leader><Left> :vertical resize -5<CR>
nnoremap <leader><Up> :resize +5<CR>
nnoremap <leader><Down> :resize -5<CR>

" autosave 
let g:auto_save = 0
let g:auto_save_events = [ "CursorHold", "CursorHoldI" ]

" Insert a new line without leaving normal mode 
nnoremap <leader>no o<Esc>0"_D
nnoremap <leader>nO O<Esc>0"_D
" 

" Navigate windows with <space-hjkl> instead of <Ctrl-w> followed by hjkl 
noremap <nowait><leader>h <c-w><c-h>
noremap <nowait><leader>j <c-w><c-j>
noremap <nowait><leader>k <c-w><c-k>
noremap <nowait><leader>l <c-w><c-l>

" Terminal Mode mappings 
if has('nvim')
    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
    nnoremap <leader>t :split \| :resize -10 \| bel terminal<CR>
    tnoremap <Esc> <C-\><C-n>:q!<CR>
    tnoremap <A-h> <c-\><c-n><c-w>h
    tnoremap <A-j> <c-\><c-n><c-w>j
    tnoremap <A-k> <c-\><c-n><c-w>k
    tnoremap <A-l> <c-\><c-n><c-w>l
endif

" Fold 
set foldmethod=indent
autocmd FileType javascript setlocal foldmethod=marker
nmap <leader>z za

" Tabs
nmap <silent> <leader>tl :tabnext<cr>
nmap <silent> <leader>th :tabprevious<cr>
nmap <leader>tn :tabnew<cr> 
nmap <silent> <leader>tc :tabclose<cr>

