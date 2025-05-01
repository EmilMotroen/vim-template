" Swap with a lightmode theme
let g:current_theme = "gruvbox"
function! ToggleTheme()
    if g:current_theme == "gruvbox"
        let g:current_theme = "PaperColor"
        execute 'set bg=light'
    else 
        let g:current_theme = "gruvbox"
        execute 'set bg=dark'
    endif
    execute 'colo ' . g:current_theme
endfunction

nnoremap <F5> :call ToggleTheme()<CR>

" Default
set bg=dark
colo gruvbox

" Configure lightline
function! GitBranch()
    let l:branch = FugitiveHead()
    return l:branch ==# '' ? '' : 'git:' . l:branch
endfunction

function! LightLineWordCount()
    return wordcount().words . ' words'
endfunction

function! CharValueHex()
    return '0x' . printf('%02X', char2nr(getline('.')[col('.') - 1]))
endfunction

let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], 
      \              [ 'fileformat', 'fileencoding', 'filetype', 'wordcount', 'charvaluehex' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'GitBranch',
      \   'wordcount': 'LightLineWordCount',
      \   'charvaluehex': 'CharValueHex'
      \ },
\ }
