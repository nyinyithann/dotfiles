let autoload_plug_path = stdpath('config') . '/plugged'

call plug#begin(autoload_plug_path) 
    source ~/.config/nvim/plugins.vim
call plug#end()

call sourcery#init()
