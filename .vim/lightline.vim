function! GitBranch()
    let l:branch = FugitiveHead()
    return l:branch ==# '' ? '' : 'git:' . l:branch
endfunction

function! LightLineWordCount()
    return wordcount().words . ' words'
endfunction

let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], 
      \              [ 'fileformat', 'fileencoding', 'filetype', 'wordcount' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'GitBranch',
      \   'wordcount': 'LightLineWordCount'
      \ },
\ }
