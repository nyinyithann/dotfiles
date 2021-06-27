# Tips & Tricks
#### Delete in Insert Mode
- `<C-h>`  delete back one character (backspace)
- `<C-w>`  delete back one word
- `<C-u>`  delete back to start of line
- `<C-k>`  delete forward to end of line

### Surround (vim-sandwich)
- `sa{motion/textobject}{addition}` e.g. `saiw(` makes foo to (foo)
- `sdb or sd{deletion}` e.g. `sdb` or `sd(` makes (foo) to foo.
- `srb{addition}` e.g. `sr("` makes (foo) to "foo".

#### Paste text while in insert mode
- `<C-r>0` or `<C-r><C-p>0` for fixing indentation issues

### Close all buffers but this
- `:BufOnly` (custom command) or `:%bd|e#`

### Move line up or down
- `:m+1` or `Alt + j` (custom cmd) move down
- `:m-2` or `Alt + k` (custom cmd) move up

## Others
- `Shift + s` insert mode at the right indentation
- `Ctrl + w =` make windows same size
- `%` go to matching brace
- `=G` fix indentation

## Navigation
- `ctrl + o` go prev
- `ctrl + i` go next
- `ciw` delete word
- `ci(` or `ci[` or `ci{` delete anything berween (), {}, []
- `cit` delete anthing between tag
- `viw` select a word and go into visual mode
- `=` go back to normal mode from visual mode
- `:line-number` go to the line
- `/search` search

## coc.vim
- `gd` definition
- `gy` type definition
- `gi` implementation
- `gr` reference
- `g[` diagnostic-prev
- `g]` diagnostic-next
- `space + rn` rename
- `:Format` format
- `:Fold` fold
- `:OR` organize imports
- `space + a` CocList diagnostic
- `space + e` CocList extensions
- `space + c` CocList commands
- `space + o` CocList outline
- `space + s` CocList -I symbols
- `:version` Coc Version
- `:CocInfo` or `:checkhealth` check coc status
- `:CocOpenLog` Coc log file
- `:messages` error messages thrown by extensions
- `K` show documentation in preview window
- `CocList` open all coc lists

## terminal fzf
- `ctrl + r` history
- `ctrl + t` current directory
- `alt + c`
- `<<cmd>>` + `ctrl + t` pipe cmd to fz current directory

## vim.fzf
- `FZF` search command
- `Files` or `shift + f` search files
- `Rg` regx search
- `BLines`
- `Lines` or `ctrl + f` search current opening file
- `Ag`
- `Buffers` `ctrl + b` search buffers

### NERDTree - Files
- `o`: open in prev window
- `go`: preview
- `t`: open in new tab
- `T`: open in new tab silently
- `i`: open split
- `gi`: preview split
- `s`: open vsplit
- `gs`: preview vsplit

### NERDTree - Directories
- `o`: open & close
- `O`: recurs­ively open
- `x`: close parent
- `X`: close all children recurs­ively
- `e`: explore selected dir

### NERDTree - Bookmarks
- `o`: open bookmark
- `t`: open in new tab
- `T`: open in new tab silently
- `D`: delete bookmark

### NERDTree - FileSystem
- `C`: change tree root to selected dir
- `u`: move tree root up a dir
- `U`: move tree root up a dir but leave old root open
- `r`: refresh cursor dir
- `R`: refresh current root
- `m`: Show menu
- `cd`: change the CWD to the selected dir
- `CD`: change tree root to CWD

### NERDTree - Tree Navigation
- `p`: go to parent
- `P`: go to root
- `K`: go to first child
- `J`: go to last child
- `<C-k>`: go to prev sibling
- `<C-j>: go to next sibling

### NERDTree - Tree Filtering
- `I`: hidden files (off)
- `f`: file filters (on)
- `F`: files (on)
- `B`: bookmarks (off)

### NERDTree - Other Commands
- `q`: Close the NERDTree window
- `a`: Zoom (maxim­ize­-mi­nimize) the NERDTree window
- `?`: toggle help

