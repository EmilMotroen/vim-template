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
set noshowmode

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
Plugin 'NLKNguyen/papercolor-theme'

call vundle#end()
filetype plugin indent on

" Set fold method and keep manual folds after closing and reopening a file
set foldmethod=manual
autocmd BufWinLeave * mkview 
autocmd BufWinEnter * silent! loadview

" Configure MarkdownPreview
source ~/.vim/markdownPreview.vim

" Configure vimtex
source ~/.vim/vimtex.vim

" Appearance and Lightline
source ~/.vim/lightline.vim

" Quality of life
set clipboard=unnamedplus
set splitbelow
set splitright
set mouse=a
