" Delete without yank
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP
nnoremap x "_x

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

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

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
hi Visual guifg=#000000 guibg=#FD971F

" Default Colors for CursorLine
highlight CursorLine guibg=#3d3d29
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
nnoremap <leader>rp :resize 100<CR>

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



" telescope
nnoremap <silent> ;t <cmd>Telescope<cr>
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;l <cmd>Telescope live_grep<cr>
nnoremap <silent> ;s <cmd>Telescope grep_string<cr>
nnoremap <silent> ;b <cmd>Telescope buffers<cr>
nnoremap <silent> ;h <cmd>Telescope help_tags<cr>
nnoremap <silent> ;ca <cmd>lua require'telescope.builtin'.lsp_code_actions{}<cr>
nnoremap <silent> ;gd <cmd>lua require'telescope.builtin'.lsp_definitions{}<cr>
nnoremap <silent> ;gs <cmd>lua require'telescope.builtin'.lsp_document_symbols{}<cr>
nnoremap <silent> ;gw <cmd>lua require'telescope.builtin'.lsp_dynamic_workspace_symbols{}<cr>
nnoremap <silent> ;gi <cmd>lua require'telescope.builtin'.lsp_implementations{}<cr>
nnoremap <silent> ;gl <cmd>Telescope diagnostics bufnr=0<cr>
nnoremap <silent> <leader>f <cmd>Telescope current_buffer_fuzzy_find<cr>

" NvimTree
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap R :NvimTreeRefresh<CR>
nnoremap <leader>nf :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

" Tabs
nmap <silent> <leader>tL :tabnext<cr>
nmap <silent> <leader>tH :tabprevious<cr>
nmap <leader>tN :tabnew 
nmap <silent> <leader>tC :tabclose<cr>
