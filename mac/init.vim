" Plugin Dirctory ~/.local/share/nvim/site/pack/jazz/start
" --------------------------------------------------------
" --------------------------------------------------------

" /Users/jazz/.config/nvim/plugged
let autoload_plug_path = stdpath('config') . '/plugged'
set nocompatible

call plug#begin(autoload_plug_path)
Plug 'preservim/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
Plug 'voldikss/vim-floaterm'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'tomasr/molokai'
Plug 'mtikekar/nvim-send-to-term'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '907th/vim-auto-save'
Plug 'joom/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-sandwich'
Plug 'thaerkh/vim-workspace'
Plug 'rescript-lang/vim-rescript'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'
" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'
" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'
" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'jordwalke/vim-reasonml'
" Plug 'scrooloose/syntastic'
" Plug 'lifepillar/vim-mucomplete'

call plug#end()


" Set up persistent undo across all files.
" set undofile
" if !isdirectory(expand("$HOME/.config/nvim/undodir"))
"     call mkdir(expand("$HOME/.config/nvim/undodir"), "p")
" endif
" set undodir=$HOME/.config/nvim/undodir

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
set nohlsearch                    " Dont Highlight search results.
set incsearch                   " Search as you type.
set number
set clipboard=unnamed,unnamedplus  " Copy into system (*, +) registers.
set backspace=indent,eol,start  " modern backspace behavior
set display=lastline,msgsep     " display more message text
set encoding=utf-8              " set default encoding
set langnoremap                 " helps avoid mappings breaking
set laststatus=2                " always display a status line
set ruler                       " display current line # in a corner
" set showcmd                     " show last command in the status line
set sidescroll=1                " smoother sideways scrolling
" set smarttab                    " tab setting aware <Tab> key
set ttyfast                     " indicates that our connection is fast
set viminfo+=!                  " save global variables across sessions
set modifiable
set buftype: " "
set nofoldenable
set noshowcmd
set noruler
set nohid
set autoread
set ignorecase
set smartcase

let g:autoclose_on = 0
" turn the following on to disable AutoPairs
" let g:AutoPairs = {}

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
set updatetime=10000

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set signcolumn=yes

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> gl <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <space>rn <Plug>(coc-rename)
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
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I -N --top symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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

" Resize
nnoremap <leader><Right> :vertical resize +5<CR>
nnoremap <leader><Left> :vertical resize -5<CR>
nnoremap <leader><Up> :resize +5<CR>
nnoremap <leader><Down> :resize -5<CR>
nnoremap <leader>rp :resize 100<CR>

" Navigate windows with <space-hjkl> instead of <Ctrl-w> followed by hjkl.
noremap <silent><leader>h <c-w><c-h>
noremap <silent><leader>j <c-w><c-j>
noremap <silent><leader>k <c-w><c-k>
noremap <silent><leader>l <c-w><c-l>

" Terminal Mode mappings
if has('nvim')
    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
    tnoremap <Esc> <c-\><c-n>
    tnoremap <C-v><Esc> <Esc>
    tnoremap <A-h> <c-\><c-n><c-w>h
    tnoremap <A-j> <c-\><c-n><c-w>j
    tnoremap <A-k> <c-\><c-n><c-w>k
    tnoremap <A-l> <c-\><c-n><c-w>l
endif


" Immediately add a closing quotes or braces in insert mode.
" To escape, press ctrl + v before typing the mapped char
" inoremap ' ''<esc>i
" inoremap " ""<esc>i
" inoremap ( ()<esc>i
" inoremap { {}<esc>i
" inoremap [ []<esc>i
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

" map Space Bar to Leader
nnoremap <SPACE> <Nop>
nmap <Space> <Leader>


" map jk to esc
inoremap <nowait> jk <esc>
" save with ctrl + s
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Dracula Theme
packadd! dracula
syntax enable

let g:gruvbox_contrast_dark = 'hard'
set background=dark

set termguicolors
colorscheme gruvbox
" colorscheme dracula
" colorscheme molokai

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

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

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" autosave
let g:auto_save = 0
let g:auto_save_events = [ "CursorHold", "CursorHoldI" ]

autocmd FileType json syntax match Comment +\/\/.\+$+

" Insert a new line without leaving normal mode
nnoremap <leader>no o<Esc>0"_D
nnoremap <leader>nO O<Esc>0"_D


" NERDTree
let NERDTreeMinimalUI=1 " remove top help line
let NERDTreeShowHidden=1
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * lcd %:p:h
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
nnoremap <silent> <C-l> :Lines<CR>
nnoremap <silent> <C-F> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>

" ReScript
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>r :RescriptFormat<CR>
autocmd FileType rescript nnoremap <silent> <buffer> <localleader>t :RescriptTypeHint<CR>
" autocmd FileType rescript nnoremap <silent> <buffer> <localleader>b :RescriptBuild<CR>
autocmd FileType rescript nnoremap <silent> <buffer> gd :RescriptJumpToDefinition<CR>
" Hooking up the ReScript autocomplete function
set omnifunc=rescript#Complete
" When preview is enabled, omnicomplete will display additional
" information for a selected item
set completeopt+=preview
" noremap <C-space> <C-x><C-o>

" vim-commentary
autocmd FileType apache setlocal commentstring=#\ %s

" To open a new empty buffer
nmap <leader>T :new<cr>

" Move to the next buffer
nmap <leader>ll :bnext<CR>

" Move to the previous buffer
nmap <leader>hh :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>ls :ls<CR>


" vim-workspace
let g:workspace_create_new_tabs = 0
nnoremap <leader>tw :ToggleWorkspace<CR>
let g:workspace_autosave = 0
let g:workspace_session_name = 'project_workspace.vim'

" markdown preview
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 1

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1,
            \ 'sequence_diagrams': {},
            \ 'flowchart_diagrams': {},
            \ 'content_editable': v:false,
            \ 'disable_filename': 0
            \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" BufOnly
command! BufOnly silent! execute "%bd|e#|bd#"

" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" nvim-window
map <silent> <leader>w :lua require('nvim-window').pick()<CR>

" floaterm
let g:floaterm_keymap_new = '<Leader>fn'
let g:floaterm_keymap_toggle = '<Leader>ft'

" easy-motion
" <leader>w - Easy-motion highlights first word letters bi-directionally
map <leader>m <Plug>(easymotion-bd-w)
" " reasonml
" autocmd FileType reason nnoremap <silent> <buffer> <localleader>r :ReasonPrettyPrint<CR>

" " reason air-line
" let g:airline_extensions = ['esy', 'reason']
" let g:reasonml_project_airline=1
" let g:reasonml_syntastic_airline=1
" let g:reasonml_clean_project_airline=1
" let g:airline#extensions#whitespace#enabled = 0
" let g:airline_powerline_fonts = 1
" let g:airline_skip_empty_sections = 1

" " mucomplete
" let g:mucomplete#can_complete = {}
" let g:mucomplete#enable_auto_at_startup = 1
" let g:mucomplete#chains = {'default': ['omni']}
