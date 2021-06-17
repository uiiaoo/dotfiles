"-----------------------------
" # variable
"-----------------------------
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

"-----------------------------
" # color theme
"-----------------------------
set background=dark
colorscheme hybrid

"-----------------------------
" # customize
"-----------------------------
highlight LineNr ctermfg=yellow
highlight SignColumn ctermfg=none ctermbg=none
highlight StatusLine ctermfg=235 ctermbg=253
highlight StatusLineNC ctermfg=235 ctermbg=240

highlight NonText ctermfg=black
highlight SpecialKey ctermfg=red
highlight Whitespace ctermfg=red

highlight Error ctermfg=red ctermbg=none cterm=bold,underline
