" Settings for the vimtex plugin

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executables' : 'latexmk',
    \ 'options' : [
    \   '-pdf',
    \   '-interaction=nonstopmode',
    \ ],
\}
