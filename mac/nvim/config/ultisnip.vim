" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



let g:UltiSnipsSnippetsDir="~/.config/nvim/plugged/vim-snippets/snippets"

set runtimepath^="~/.config/nvim/plugged/vim-snippets"

let g:UltiSnipsSnippetDirectories=["UltiSnips"]
