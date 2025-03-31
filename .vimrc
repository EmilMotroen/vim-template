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
set laststatus=2
syntax on
set wrap
set linebreak
set wildmode=longest,list,full
set wildmenu
set cursorline

" Add closing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Add closing backticks in Markdown
inoremap ``` ``````<left><left><left><CR><CR><up><Tab>

" Keyboard mappings
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i<right>

" Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'itchyny/lightline.vim'
Plugin 'tpope/fugitive.vim'
Plugin 'preservim/nerdtree'
Plugin 'junegunn/seoul256.vim'
Plugin 'airblade/gitgutter.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'Valloric/YouCompleteMe'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'lervag/vimtex'
Plugin 'morhetz/gruvbox'
Plugin 'ap/vim-css-color'
Plugin 'plantuml/plantuml'

call vundle#end()
filetype plugin indent on

" Set fold method and keep manual folds after closing and reopening a file
set foldmethod=manual
autocmd BufWinLeave * mkview 
autocmd BufWinEnter * silent! loadview


" Configure MarkdownPreview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_brower_func = ''
let g:mkdp_markdown_css = expand('~/.vim/css/markdown.css')
let g:mkdp_highlight_css = '' 
let g:mkdp_port = ''
let g:mkdp_filetypes = ['markdown']
let g:mkdp_theme = 'light'

" MarkdownPreview mappings
nmap <F8> :w<CR>:MarkdownPreview<CR>
nmap <F9> :MarkdownPreviewStop<CR>
imap <F8> <ESC>:w<CR>:MarkdownPreview<CR>

" Configure vimtex
source ~/.vim/vimtex.vim

" Appearance
set bg=dark
if filereadable(expand("$HOME/.vim/bundle/gruvbox/colors/gruvbox.vim"))
    colo gruvbox
endif

" Configure lightline
source ~/.vim/lightline.vim 

" Quality of life
set clipboard=unnamedplus
set splitbelow
set splitright
set mouse=a
