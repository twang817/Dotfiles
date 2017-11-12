if &compatible
    set compatible
endif

let g:dein#cache_directory=expand('~/.vim/.cache/dein')
set runtimepath^=~/.vim/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim'))
    call dein#begin(expand('~/.vim'))
    call dein#load_toml(expand('~/.vim/plugins.toml'))
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
    call dein#install()
endif

call dein#call_hook('source')
call dein#call_hook('post_source')
