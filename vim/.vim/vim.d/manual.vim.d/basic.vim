"-----------------------------
" # character
"-----------------------------
set encoding=utf-8

set list
set listchars=tab:>\ ,trail:_,eol:$

set nofoldenable

"-----------------------------
" # guide
"-----------------------------
set number
set signcolumn=yes
set cursorline

"-----------------------------
" # status line
"-----------------------------
set laststatus=2
set noshowmode
set showcmd

let s:statusline = "
\ 
\%t
\ 
\[%04l:%02c]
\%m
\%r
\%h
\%w
\%=
\%{toupper(&filetype)}
\ | 
\%{toupper(&encoding)}
\ | 
\%P
\ 
\"

augroup reset_statusline
    autocmd!
    autocmd VimEnter,FileType * let &statusline = s:statusline
augroup END

"-----------------------------
" # search
"-----------------------------
set incsearch
set hlsearch
set ignorecase
set smartcase

"-----------------------------
" # indent
"-----------------------------
set expandtab
set tabstop=4
set softtabstop=4

set autoindent
set shiftwidth=4

"-----------------------------
" # file type
"-----------------------------
filetype plugin indent on
syntax enable

"-----------------------------
" # tmp file
"-----------------------------
set viminfo=
set noswapfile
set nobackup

"-----------------------------
" # clip board
"-----------------------------
set clipboard=unnamed,unnamedplus
