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


