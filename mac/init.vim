" Plugin Dirctory ~/.local/share/nvim/site/pack/jazz/start
" --------------------------------------------------------

" /Users/jazz/.config/nvim/plugged
let autoload_plug_path = stdpath('config') . '/plugged'
set nocompatible

call plug#begin(autoload_plug_path)
Plug 'preservim/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
Plug 'voldikss/vim-floaterm'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'mtikekar/nvim-send-to-term'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '907th/vim-auto-save'
Plug 'joom/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-sandwich'
Plug 'rescript-lang/vim-rescript'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'HerringtonDarkholme/yats.vim'               " Typescript syntax highlighting
Plug 'mxw/vim-jsx'                                " ReactJS JSX syntax highlighting
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'                            " Improved syntax highlighting and indentation
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'christoomey/vim-tmux-navigator'
Plug 'matze/vim-move'
Plug 'rrethy/vim-illuminate'
Plug 'machakann/vim-highlightedyank'
Plug 'Luxed/ayu-vim'
Plug 'Yggdroot/indentLine'
Plug 'liuchengxu/vista.vim'
Plug 'karb94/neoscroll.nvim'
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
call plug#end()

syntax on                          " Enable syntax highlighting.
filetype plugin indent on          " Enable file type based indentation.
set autoindent                     " Respect indentation when starting a new line.
set expandtab                      " Expand tabs to spaces. Essential in Python.
set tabstop=4                      " Number of spaces tab is counted for.
set shiftwidth=4                   " Number of spaces to use for autoindent.
set backspace=2                    " Fix backspace behavior on most terminals.
set wildmenu                       " Enable enhanced tab autocomplete.
set wildmode=list:longest,full     " Complete till longest string, then open menu.
set nohlsearch                       " Dont Highlight search results.
set incsearch                      " Search as you type.
set number
set clipboard=unnamed,unnamedplus  " Copy into system (*, +) registers.
set backspace=indent,eol,start     " modern backspace behavior
set display=lastline,msgsep        " display more message text
set encoding=utf-8                 " set default encoding
set langnoremap                    " helps avoid mappings breaking
set laststatus=2                   " always display a status line
set ruler                          " display current line # in a corner
set sidescroll=1                   " smoother sideways scrolling
set ttyfast                        " indicates that our connection is fast
set viminfo+=!                     " save global variables across sessions
set modifiable
set buftype: " "
set nofoldenable
set noshowcmd
set noruler
set nohid
set autoread
set ignorecase
set smartcase
set cursorline
set splitright
set wrap
let g:autoclose_on = 0
set wildignore=*.swp,*.bak,*.pyc,*.class,*.egg-info,.git,.svn,.hg,.bzr,.env,node_modules,.sass-cache
" turn the following on to disable AutoPairs
" let g:AutoPairs = {}
" TextEdit might fail if hidden is not set
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set signcolumn=yes
set completeopt-=preview
set completeopt+=menuone
set completeopt+=noinsert,noselect

" Essential mapping to me {{
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

    " move lines (vim-moves)
    " S-k S-j
    let g:move_key_modifier = 'A'

    "Remove all trailing whitespace by pressing F5
    nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

    nmap <silent> <F3> :so $MYVIMRC<CR>

    " select all
    nnoremap <silent> <C-a> ggVG
   
    " By pressing ctrl+r in visual mode, you will be prompted to enter text to replace with. 
    " Press enter and then confirm each change you agree with y or decline with n.
    vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" }}

" Fold {{
    set foldmethod=indent
    autocmd FileType javascript setlocal foldmethod=marker
    nmap <leader>z za
" }}

" Coc {{
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
    nmap <silent> gl <Plug>(coc-diagnostic-prev)
    nmap <silent> gn <Plug>(coc-diagnostic-next)
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Run the Code Lens action on the current line.
    nmap <leader>cl  <Plug>(coc-codelens-action)

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
" }}

" Resize {{
    nnoremap <leader><Right> :vertical resize +5<CR>
    nnoremap <leader><Left> :vertical resize -5<CR>
    nnoremap <leader><Up> :resize +5<CR>
    nnoremap <leader><Down> :resize -5<CR>
    nnoremap <leader>rp :resize 100<CR>
" }}

" Navigate windows with <space-hjkl> instead of <Ctrl-w> followed by hjkl {{
    noremap <nowait><leader>h <c-w><c-h>
    noremap <nowait><leader>j <c-w><c-j>
    noremap <nowait><leader>k <c-w><c-k>
    noremap <nowait><leader>l <c-w><c-l>
" }}

" Terminal Mode mappings {{
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
" }}

" Theme {{
    syntax enable

    set termguicolors
    set background=dark
    " set background=light

    let g:gruvbox_contrast_dark = 'hard'
    " colorscheme gruvbox

    " let g:ayucolor="mirage" " for mirage version of theme
    let g:ayucolor="dark"   " for dark version of theme
    " NOTE: g:ayucolor will default to 'dark' when not set. 
    colorscheme ayu
" }}

" air-line {{
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
" }}

" autosave {{
    let g:auto_save = 0
    let g:auto_save_events = [ "CursorHold", "CursorHoldI" ]
" }}

autocmd FileType json syntax match Comment +\/\/.\+$+

" vim-commentary {{
    autocmd FileType apache setlocal commentstring=#\ %s
" }}

" Insert a new line without leaving normal mode {{
    nnoremap <leader>no o<Esc>0"_D
    nnoremap <leader>nO O<Esc>0"_D
" }}


" NerdTree {{
    nnoremap <leader>e :NERDTreeToggle<CR>
    nnoremap <leader>ntf :NERDTreeFind<CR>
    let NERDTreeMinimalUI=1 " remove top help line
    let NERDTreeShowHidden=1
    let NERDTreeAutoDeleteBuffer = 1
    let NERDTreeDirArrows = 1
    autocmd VimEnter * NERDTree | wincmd p
    autocmd BufWinEnter * silent NERDTreeMirror     " Open the existing NERDTree on each new tab.
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'

" }}

" FZF Vim {{
    set rtp+=/usr/bin/fzf
    nnoremap <silent> <leader>fl :Lines<CR>
    nnoremap <silent> <leader>ff :Files<CR>
    nnoremap <silent> <leader>fb :Buffers<CR>
" }}

" ReScript {{
    autocmd FileType rescript nnoremap <silent> <buffer> <leader>r :RescriptFormat<CR>
    autocmd FileType rescript nnoremap <silent> <buffer> <leader>t :RescriptTypeHint<CR>
    " autocmd FileType rescript nnoremap <silent> <buffer> <localleader>b :RescriptBuild<CR>
    autocmd FileType rescript nnoremap <silent> <buffer> gd :RescriptJumpToDefinition<CR>
    " Hooking up the ReScript autocomplete function
    set omnifunc=rescript#Complete
    " When preview is enabled, omnicomplete will display additional
    " information for a selected item
"}}


" Markdown preview {{
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
" }}

" nvim-window {{
    map <silent> <leader>w :lua require('nvim-window').pick()<CR>
" }}

" Floaterm {{
    let g:floaterm_keymap_new = '<Leader>fn'
    let g:floaterm_keymap_toggle = '<Leader>ft'
" }}

" easy-motion {{
    map <leader>m <Plug>(easymotion-bd-w)
" }}

" vim-illuminate {{
    " Time in milliseconds (default 0)
    let g:Illuminate_delay = 100
" }}

" vim-highlightedyank {{
    let g:highlightedyank_highlight_duration = 1000
" }}

" IndentLine {{
    let g:indentLine_char = '┆'
    let g:indentLine_first_char = '┆'
    let g:indentLine_showFirstIndentLevel = 1
    let g:indentLine_setColors = 0
" }}

" Vista {{
    function! NearestMethodOrFunction() abort
      return get(b:, 'vista_nearest_method_or_function', '')
    endfunction

    set statusline+=%{NearestMethodOrFunction()}

    " By default vista.vim never run if you don't call it explicitly.
    "
    " If you want to show the nearest function in your statusline automatically,
    " you can add the following line to your vimrc
    autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
    " How each level is indented and what to prepend.
    " This could make the display more compact or more spacious.
    " e.g., more compact: ["▸ ", ""]
    " Note: this option only works for the kind renderer, not the tree renderer.
    let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

    " Executive used when opening vista sidebar without specifying it.
    " See all the avaliable executives via `:echo g:vista#executives`.
    let g:vista_default_executive = 'ctags'

    " Set the executive for some filetypes explicitly. Use the explicit executive
    " instead of the default one for these filetypes when using `:Vista` without
    " specifying the executive.
    let g:vista_executive_for = {
      \ 'cpp': 'vim_lsp',
      \ 'php': 'vim_lsp',
      \ }

    " Declare the command including the executable and options used to generate ctags output
    " for some certain filetypes.The file path will be appened to your custom command.
    " For example:
    let g:vista_ctags_cmd = {
          \ 'haskell': 'hasktags -x -o - -c',
          \ }

    " To enable fzf's preview window set g:vista_fzf_preview.
    " The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
    " For example:
    let g:vista_fzf_preview = ['right:50%']
    " Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
    let g:vista#renderer#enable_icon = 1

    " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
    let g:vista#renderer#icons = {
    \   "function": "\uf794",
    \   "variable": "\uf71b",
    \  }


    nmap <silent> <leader>vf :Vista finder<CR>
" }}

" UltiSnips {{
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsEditSplit="vertical"
" }}

" Cursorline color {{
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
"" }}

