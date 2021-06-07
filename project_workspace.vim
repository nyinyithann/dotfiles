let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/my/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +80 mac/shortcuts.md
badd +127 mac/init.vim
badd +18 README.md
badd +3 mac/karabiner.json
badd +61 mac/kitty.conf
badd +1 mac/iterm_keys.md
badd +0 term://.//16489:/bin/zsh
argglobal
%argdel
edit mac/init.vim
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 73) / 147)
exe '2resize ' . ((&lines * 29 + 31) / 62)
exe 'vert 2resize ' . ((&columns * 115 + 73) / 147)
exe '3resize ' . ((&lines * 28 + 31) / 62)
exe 'vert 3resize ' . ((&columns * 115 + 73) / 147)
argglobal
enew
file NERD_tree_1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
if bufexists("term://.//16489:/bin/zsh") | buffer term://.//16489:/bin/zsh | else | edit term://.//16489:/bin/zsh | endif
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 9 - ((8 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 03|
wincmd w
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
let s:l = 132 - ((16 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
132
normal! 04|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 73) / 147)
exe '2resize ' . ((&lines * 29 + 31) / 62)
exe 'vert 2resize ' . ((&columns * 115 + 73) / 147)
exe '3resize ' . ((&lines * 28 + 31) / 62)
exe 'vert 3resize ' . ((&columns * 115 + 73) / 147)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
