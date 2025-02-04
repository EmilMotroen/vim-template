" Basic settings
set number
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set showcmd
set wildmenu
set ignorecase
set smartcase
set incsearch
set hlsearch
set visualbell
set t_vb=
set ruler
set showmatch

" Add closing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Keyboard mappings
" Save file with F2 when in normal mode
nmap <F2> :w<CR>
" In insert mode, go to normal mode, save the file and go back to insert mode
imap <F2> <ESC>:w<CR>i

" Appearance
syntax enable
set background=dark
colorscheme cs

" Quality of life
set clipboard=unnamedplus
set splitbelow
set splitright
