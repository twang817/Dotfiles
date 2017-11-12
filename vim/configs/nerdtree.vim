let NERDTreeNaturalSort=1
let NERDTreeChDirMode=2
let NERDTreeRespectWildIgnore=1
let NERDTreeShowLineNumbers=1

nnoremap <leader>nt :NERDTreeToggle <C-R>=expand('%p:%h') . '/'<cr><cr>
