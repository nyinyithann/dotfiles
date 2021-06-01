" Plugin Dirctory ~/.local/share/nvim/site/pack/jazz/start
" --------------------------------------------------------
" --------------------------------------------------------

set undofile

" Set up persistent undo across all files.
set undofile
if !isdirectory(expand("$HOME/.config/nvim/undodir"))
  call mkdir(expand("$HOME/.config/nvim/undodir"), "p")
endif
set undodir=$HOME/.config/nvim/undodir

syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.

set autoindent             " Respect indentation when starting a new line.
set expandtab              " Expand tabs to spaces. Essential in Python.
set tabstop=4              " Number of spaces tab is counted for.
set shiftwidth=4           " Number of spaces to use for autoindent.
set backspace=2            " Fix backspace behavior on most terminals.
set foldmethod=indent           " Indentation-based folding.
set wildmenu                    " Enable enhanced tab autocomplete.
set wildmode=list:longest,full  " Complete till longest string, then open menu.
set hlsearch                    " Highlight search results.
set incsearch                   " Search as you type.
set number
set clipboard=unnamed,unnamedplus  " Copy into system (*, +) registers.
set backspace=indent,eol,start  " modern backspace behavior
set display=lastline,msgsep     " display more message text
set encoding=utf-8              " set default encoding
set langnoremap                 " helps avoid mappings breaking
set laststatus=2                " always display a status line
set ruler                       " display current line # in a corner
set showcmd                     " show last command in the status line
set sidescroll=1                " smoother sideways scrolling
set smarttab                    " tab setting aware <Tab> key
set ttyfast                     " indicates that our connection is fast
set viminfo+=!                  " save global variables across sessions
set modifiable
set buftype: " "
set nofoldenable

" coc.vim related config
" TextEdit might fail if hidden is not set
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=1500

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>x  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Resize
nnoremap <leader><Right> :vertical resize +5<CR>
nnoremap <leader><Left> :vertical resize -5<CR>
nnoremap <leader><Up> :resize +5<CR>
nnoremap <leader><Down> :resize -5<CR>
nnoremap <leader>rp :resize 100<CR>

" Navigate windows with <space-hjkl> instead of <Ctrl-w> followed by hjkl.
noremap <leader>h <c-w><c-h>
noremap <leader>j <c-w><c-j>
noremap <leader>k <c-w><c-k>
noremap <leader>l <c-w><c-l>

" Immediately add a closing quotes or braces in insert mode.
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i

" map Space Bar to Leader
nnoremap <SPACE> <Nop>
nmap <Space> <Leader>

inoremap <nowait> jk <esc> " map jk to esc
inoremap <silent> <c-s> <c-o>:update<cr> " save file with Ctrl+s
" map <leader>l $                     " move to the end of the current line 
" map <leader>h ^                     " move to the beginning of the current line

" Dracula Theme
packadd! dracula
syntax enable
" colorscheme dracula

"let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme='serene'

" autosave
let g:auto_save = 1
let g:auto_save_events = [ "CursorHold", "CursorHoldI" ]

autocmd FileType json syntax match Comment +\/\/.\+$+

" NERDTree
let NERDTreeMinimalUI=1 " remove top help line
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <leader>e :NERDTreeToggle<CR>


" FZF Vim
set rtp+=/usr/bin/fzf
nnoremap <silent> <C-f> :Lines<CR>
nnoremap <silent> <S-F> :Files<CR>


" ReScript
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>r :RescriptFormat<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>t :RescriptTypeHint<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>b :RescriptBuild<CR>
autocmd FileType rescript nnoremap <silent> <buffer> gd :RescriptJumpToDefinition<CR>
" Hooking up the ReScript autocomplete function
set omnifunc=rescript#Complete
" When preview is enabled, omnicomplete will display additional
" information for a selected item
set completeopt+=preview

" vim-commentary
autocmd FileType apache setlocal commentstring=#\ %s

