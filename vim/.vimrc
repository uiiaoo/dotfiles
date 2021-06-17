let $MYDOTVIM = split(&runtimepath, ',')[0]

let $CACHEDIR = $MYDOTVIM . '/cache'
let $DEINTOML = $MYDOTVIM . '/deintoml'
let $DEINBASE = $CACHEDIR . '/dein'

let $MANUAL_VIM = 'vim.d/manual.vim.d'
let $PLUGIN_VIM = 'vim.d/plugin.vim.d'

"-----------------------------
" # dein setting
"-----------------------------
set runtimepath+=$DEINBASE/repos/github.com/Shougo/dein.vim

call dein#begin($DEINBASE, expand('<sfile>'))

call dein#load_toml($DEINTOML . '/common.toml'      , {'lazy': 0})
call dein#load_toml($DEINTOML . '/common_lazy.toml' , {'lazy': 1})
call dein#load_toml($DEINTOML . '/filetype.toml'    , {'lazy': 1})
call dein#load_toml($DEINTOML . '/vim.toml'         , {'lazy': 1, 'if': !has('nvim')})
call dein#load_toml($DEINTOML . '/neovim.toml'      , {'lazy': 1, 'if':  has('nvim')})

call dein#end()

if dein#check_install()
    call dein#install()
endif

"-----------------------------
" # load other rc file
"-----------------------------
runtime! $MANUAL_VIM/*.vim

if has('nvim')
    runtime! $MANUAL_VIM/*.nvim
endif
