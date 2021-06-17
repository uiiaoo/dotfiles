"-----------------------------
" # bracket
"-----------------------------
inoremap  (<CR>   ()<LEFT>
inoremap  {<CR>   {}<LEFT>
inoremap  [<CR>   []<LEFT>
inoremap  "<CR>   ""<LEFT>
inoremap  '<CR>   ''<LEFT>
inoremap  `<CR>   ``<LEFT>
inoremap  <<CR>   <><LEFT>
inoremap \|<CR> \|\|<LEFT>

"-----------------------------
" # middle click
"-----------------------------
nnoremap   <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>
inoremap   <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>

"-----------------------------
" # emacs
"-----------------------------
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>w
inoremap <C-b> <C-o>b
inoremap <C-d> <C-o>x

"-----------------------------
" # command
"-----------------------------
command! B !./build.sh
