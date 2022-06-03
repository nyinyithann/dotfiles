filetype plugin indent on              " Enable file type based indentation.
syntax enable
set title
set background=dark
set autoindent                         " Respect indentation when starting a new line.
set smartindent
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
set splitbelow
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

filetype plugin indent on

set rtp^="/Users/jazz/.opam/default/share/ocp-indent/vim"
