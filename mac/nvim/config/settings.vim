filetype plugin indent on              " Enable file type based indentation.
syntax enable
set title
set background=dark
set autoindent                         " Respect indentation when starting a new line.
set expandtab                          " Expand tabs to spaces. Essential in Python.
set tabstop=4                          " Number of spaces tab is counted for.
set shiftwidth=4                       " Number of spaces to use for autoindent.
set backspace=2                        " Fix backspace behavior on most terminals.
set wildmenu                           " Enable enhanced tab autocomplete.
set wildmode=list:longest,full         " Complete till longest string, then open menu.
set incsearch                          " Search as you type.
set number                             " line number
set clipboard=unnamed,unnamedplus      " Copy into system (*, +) registers.
set backspace=indent,eol,start         " modern backspace behavior
set display=lastline,msgsep            " display more message text
set encoding=utf-8                     " set default encoding
set langnoremap                        " helps avoid mappings breaking
set laststatus=2                       " always display a status line
set ruler                              " display current line # in a corner
set sidescroll=1                       " smoother sideways scrolling
set ttyfast                            " indicates that our connection is fast
set viminfo+=!                         " save global variables across sessions
set modifiable                         " makes a buffer modifiable
set buftype: " "
set autoread
set ignorecase
set smartcase
set cursorline
set splitright
set wrap
set wildignore=*.swp,*.bak,*.pyc,*.class,*.egg-info,.git,.svn,.hg,.bzr,.env,node_modules,.sass-cache
" turn the following on to disable AutoPairs
" let g:AutoPairs = {}
" TextEdit might fail if hidden is not set
set hidden
" Some servers have issues with backup files, see #649.
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
set showcmd
set scrolloff=10
set shell=/bin/zsh
set backupskip=/tmp/*,/private/tmp/*
set ai "Auto indent
set si "Smart indent
set wildignore+=*/node_modules/*
set backspace=start,eol,indent " Finding files - Search down into subfolders
set path+=** " Add asterisks in block comments
set formatoptions+=r
set completeopt=menuone,noinsert,noselect

set nocompatible
set nobackup
set nowritebackup
set nohlsearch                         " Dont Highlight search results.
set nofoldenable
set noruler
set nohid

let g:autoclose_on = 0

" incremental substitution (neovim)
if has('nvim')
    set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set termguicolors " this variable must be enabled for colors to be applied properly


let g:nvim_tree_window_picker_exclude = {
            \   'filetype': [
                \     'notify',
                \     'packer',
                \     'qf'
                \   ],
                \   'buftype': [
                    \     'terminal'
                    \   ]
                    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = {} " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
            \ 'git': 1,
            \ 'folders': 1,
            \ 'files': 1,
            \ 'folder_arrows': 1,
            \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
            \ 'default': '',
            \ 'symlink': '',
            \ 'git': {
                \   'unstaged': "✗",
                \   'staged': "✓",
                \   'unmerged': "",
                \   'renamed': "➜",
                \   'untracked': "★",
                \   'deleted': "",
                \   'ignored': "◌"
                \   },
            \ 'folder': {
                \   'arrow_open': "",
                \   'arrow_closed': "",
                \   'default': "",
                \   'open': "",
                \   'empty': "",
                \   'empty_open': "",
                \   'symlink': "",
                \   'symlink_open': "",
                \   }
    \ }

highlight NvimTreeExecFile guifg=#67bf86 gui=None
highlight NvimTreeFolderName guifg=#0aa0f7 gui=None
highlight NvimTreeRootFolder guifg=#ffb44a gui=None
highlight NvimTreeOpenedFile guifg=#ffffff gui=None
" autocmd ColorScheme * highlight highlight NvimTreeBg guibg=#858585
autocmd FileType NvimTree setlocal winhighlight=Normal:NvimTreeBg

let g:highlightedyank_highlight_duration = 1000
