augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi link illuminatedWord CursorLine
augroup END

" Time in milliseconds (default 0)
let g:Illuminate_delay = 50

let g:Illuminate_highlightUnderCursor = 1
