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
set updatetime=4000
set modifiable
set buftype: " "
set nofoldenable
" :nnoremap <space>e :CocCommand explorer<CR> "open coc explorer

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

inoremap <nowait> jj <esc> " map jj to esc
inoremap <silent> <c-s> <c-o>:update<cr> " save file with Ctrl+s
" map <leader>l $                     " move to the end of the current line 
" map <leader>h ^                     " move to the beginning of the current line



function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:gruvbox_contrast_dark = 'hard'
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
let g:airline_theme='wombat'

" autosave
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "TextChangedI", "CursorHold", "CursorHoldI", "CompleteDone"]

autocmd FileType json syntax match Comment +\/\/.\+$+

" NERDTree
let NERDTreeMinimalUI=1 " remove top help line
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
nnoremap <leader>e :NERDTreeToggle<CR>

" FZF Vim
set rtp+=/usr/bin/fzf
nnoremap <silent> <C-f> :Lines<CR>
nnoremap <silent> <S-F> :Files<CR>