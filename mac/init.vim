let autoload_plug_path = stdpath('config') . '/plugged'

call plug#begin(autoload_plug_path) 
    Plug 'matze/vim-move'
    Plug 'neovim/nvim-lspconfig'
    Plug 'Luxed/ayu-vim'
    Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
    Plug 'mattn/emmet-vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'rrethy/vim-illuminate'
    Plug 'Yggdroot/indentLine'
    Plug 'machakann/vim-highlightedyank'
    Plug 'ryanoasis/vim-devicons'
    Plug 'machakann/vim-sandwich'   
    Plug 'joom/vim-commentary'
    Plug 'jose-elias-alvarez/null-ls.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'MunifTanjim/prettier.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'onsails/lspkind-nvim'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'akinsho/bufferline.nvim'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

" Setting Variables {{
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

" End Setting Variables }}

" General Mapping {{
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
    nmap ss :split<Return><C-w>w
    nmap sv :vsplit<Return><C-w>w

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
" End General Mapping }}

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

" Resize {{
    nnoremap <leader><Right> :vertical resize +5<CR>
    nnoremap <leader><Left> :vertical resize -5<CR>
    nnoremap <leader><Up> :resize +5<CR>
    nnoremap <leader><Down> :resize -5<CR>
    nnoremap <leader>rp :resize 100<CR>
" }}

" autosave {{
    let g:auto_save = 0
    let g:auto_save_events = [ "CursorHold", "CursorHoldI" ]
" }}

" Insert a new line without leaving normal mode {{
    nnoremap <leader>no o<Esc>0"_D
    nnoremap <leader>nO O<Esc>0"_D
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

" Fold {{
    set foldmethod=indent
    autocmd FileType javascript setlocal foldmethod=marker
    nmap <leader>z za
" }}

" Theme {{
    set termguicolors
    let g:gruvbox_contrast_dark = 'hard'
    let g:ayucolor="dark"   " for dark version of theme
    colorscheme ayu
" }}

" File Types {{
    autocmd FileType json syntax match Comment +\/\/.\+$+
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

    autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
    autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
" End File Types }}

" ***************Plugins**************** {{

"  Vim-Move {{
  " move lines pressing alt key with h, k, j, l
  " S-k S-j
  let g:move_key_modifier = 'A'
" End Vim-Move }}

" nvim-window {{
    map <silent> <leader>w :lua require('nvim-window').pick()<CR>
" }}

" easy-motion {{
    map <leader>m <Plug>(easymotion-bd-w)
" }}

" vim-illuminate {{
    " Time in milliseconds (default 0)
    let g:Illuminate_delay = 100
" }}

" IndentLine {{
    let g:indentLine_char = '┆'
    let g:indentLine_first_char = '┆'
    let g:indentLine_showFirstIndentLevel = 0
    let g:indentLine_setColors = 0
" }}

" vim-highlightedyank {{
    let g:highlightedyank_highlight_duration = 1000
" }}

" vim-commentary {{
    autocmd FileType apache setlocal commentstring=#\ %s
" }}

" ************End Plugins*************** }}

" *********** Lua Plugin >> Language Server ************
lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', 'gl', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- formatting
  if client.name == 'tsserver' or client.name == 'diagnosticls' then
    client.resolved_capabilities.document_formatting = false
  end

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
    vim.api.nvim_command [[augroup END]]
  end


end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  capabilities = capabilities
}

nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier_d_slim',
        rootPatterns = { '.git' },
        -- requiredFiles: { 'prettier.config.js' },
        args = { '--stdin', '--stdin-filepath', '%filename' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'prettier',
      javascriptreact = 'prettier',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'prettier',
      typescriptreact = 'prettier',
      json = 'prettier',
      markdown = 'prettier',
    }
  }
}

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)
EOF
"******* End Language Server Config **************************

"******* prettier.vim ***************************
lua << EOF
local null_ls = require("null-ls")
local prettier = require("prettier")

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")
      -- format on save
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    end

    if client.resolved_capabilities.document_range_formatting then
      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
  end,
})

prettier.setup({
  bin = 'prettier', -- or `prettierd`
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  },

  -- prettier format options (you can use config files too. ex: `.prettierrc`)
  arrow_parens = "always",
  bracket_spacing = true,
  embedded_language_formatting = "auto",
  end_of_line = "lf",
  html_whitespace_sensitivity = "css",
  jsx_bracket_same_line = false,
  jsx_single_quote = false,
  print_width = 80,
  prose_wrap = "preserve",
  quote_props = "as-needed",
  semi = true,
  single_quote = false,
  tab_width = 2,
  trailing_comma = "es5",
  use_tabs = false,
  vue_indent_script_and_style = false,
})
EOF
"******* end prettier.vim **********************

"******* tree-sitter ***************************
lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "php",
    "json",
    "yaml",
    "swift",
    "html",
    "scss"
  },
}
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
EOF

"******* end tree-sitter ***********************

"**** vim cmp
set completeopt=menuone,noinsert,noselect

lua <<EOF
    local status, lspkind = pcall(require, "lspkind")
    if (not status) then return end

    lspkind.init({
      -- enables text annotations
      --
      -- default: true
      with_text = true,

      -- default symbol map
      -- can be either 'default' (requires nerd-fonts font) or
      -- 'codicons' for codicon preset (requires vscode-codicons font)
      --
      -- default: 'default'
      preset = 'codicons',

      -- override preset symbols
      --
      -- default: {}
      symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
      },
    })
  local cmp = require'cmp'
  local lspkind = require'lspkind'

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    }),
    formatting = {
      format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    }
  })

  vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]
EOF
"**** end vim-cmp

"*** telescope
nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;g <cmd>Telescope live_grep<cr>
nnoremap <silent> ;b <cmd>Telescope buffers<cr>
nnoremap <silent> ;h <cmd>Telescope help_tags<cr>
nnoremap <silent> ;t <cmd>Telescope<cr>
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
} 
EOF
"*** end telescope

"*** vim-fugitive
" Status line
if !exists('*fugitive#statusline')
  set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
  set statusline+=%=
  set statusline+=%{fugitive#statusline()}
endif

cnoreabbrev g Git
cnoreabbrev gopen GBrowse
"*** end vim-fugitive

"*** lua line
lua << EOF
local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {
      { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}
EOF
"*** end lua line

"*** Nvim Tree ***
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

nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap R :NvimTreeRefresh<CR>
nnoremap <leader>nf :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

lua << EOF
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}
EOF
highlight NvimTreeExecFile guifg=#67bf86 gui=None
highlight NvimTreeFolderName guifg=#0aa0f7 gui=None
highlight NvimTreeRootFolder guifg=#ffb44a gui=None
highlight NvimTreeOpenedFile guifg=#ffffff gui=None
autocmd ColorScheme * highlight highlight NvimTreeBg guibg=#858585 -- #2B4252
autocmd FileType NvimTree setlocal winhighlight=Normal:NvimTreeBg
"*** end nvim tree

"*** buffer line 
lua << EOF
require('bufferline').setup {
    options = {
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
          -- remove extension from markdown files for example
          if buf.name:match('%.md') then
            return vim.fn.fnamemodify(buf.name, ':t:r')
          end
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return "("..count..")"
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number, buf_numbers)
          -- filter out filetypes you don't want to see
          if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
            return true
          end
          -- filter out by buffer name
          if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
            return true
          end
          -- filter out based on arbitrary rules
          -- e.g. filter out vim wiki buffer from tabline in your work repo
          if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
            return true
          end
          -- filter out by it's index number in list (don't show first buffer)
          if buf_numbers[1] ~= buf_number then
            return true
          end
        end,
        offsets = {{filetype = "NvimTree", text = "File Explorer" }},
        show_buffer_icons = true , -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_close_icon = false ,
        show_tab_indicators = true ,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin" ,
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        sort_by = 'id',
      }
    }
EOF
" test
"*** end buffer line
