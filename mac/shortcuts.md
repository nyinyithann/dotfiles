## navigation
`ctrl+o` go prev
`:MarkdownPreviewctrl+i` go next
`ciw` delete word
`ci(` or `ci[` or `ci{` delete anything berween (), {}, []
`cit` delete anthing between tag
`viw` select a word and go into visual mode
`=` go back to normal mode from visual mode 
`:line-number` go to the line 
`/search` search

### NERDTree
#### Files
o: open in prev window
go: preview
t: open in new tab
T: open in new tab silently
i: open split
gi: preview split
s: open vsplit
gs: preview vsplit

### Directories
o: open & close
O: recurs­ively open
x: close parent
X: close all children recurs­ively
e: explore selected dir

### Bookmarks
o: open bookmark
t: open in new tab
T: open in new tab silently
D: delete bookmark

### FileSystem
C: change tree root to selected dir
u: move tree root up a dir
U: move tree root up a dir but leave old root open
r: refresh cursor dir
R: refresh current root
m: Show menu
cd: change the CWD to the selected dir
CD: change tree root to CWD

### Tree Navigation
p: go to parent
P: go to root
K: go to first child
J: go to last child
<C-k>: go to prev sibling
<C-j>: go to next sibling

### Tree Filtering
I: hidden files (off)
f: file filters (on)
F: files (on)
B: bookmarks (off)

### Other Commands
q: Close the NERDTree window
A: Zoom (maxim­ize­-mi­nimize) the NERDTree window
?: toggle help

## coc.vim
`gd` definition
`gy` type definition
`gi` implementation
`gr` reference
`g[` diagnostic-prev
`g]` diagnostic-next
`space + rn` rename
`:Format` format
`:Fold` fold
`:OR` organize imports
`space + a` CocList diagnostic
`space + e` CocList extensions
`space + c` CocList commands
`space + o` CocList outline
`space + s` CocList -I symbols
`:version` Coc Version
`:CocInfo` or `:checkhealth` check coc status
`:CocOpenLog` Coc log file
`:messages` error messages thrown by extensions
`K` show documentation in preview window
`CocList` open all coc lists

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
- `Lines` or `ctrl + f`
- `Ag`
- `Buffers`
