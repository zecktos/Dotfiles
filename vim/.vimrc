"-----behavior-------------
set nocompatible
filetype plugin on
filetype indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab 
au Filetype python set shiftround textwidth=79 
set autoindent
set encoding=utf-8

"-----navigate-with-vim-movements--------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"-----visuals---------------
syntax on
color torte
set number
set ruler
set cursorline

highlight Normal ctermbg=none
highlight SignColumn ctermbg=none

highlight CursorLine cterm=none
highlight CursorLineNr cterm=bold ctermfg=white ctermbg=none
highlight LineNr ctermfg=darkgrey

highlight StatusLine ctermfg=cyan ctermbg=none cterm=none
highlight StatusLineNC ctermfg=white ctermbg=none cterm=none
highlight VertSplit cterm=none 

highlight Pmenu ctermbg=none ctermfg=cyan
highlight PmenuSel ctermbg=darkgrey ctermfg=fg

" Change Color when entering Insert Mode
autocmd InsertEnter * highlight  CursorLineNr ctermfg=red ctermbg=none
" Revert Color to default when leaving Insert Mode
autocmd InsertLeave * highlight  CursorLineNr ctermfg=white ctermbg=none

"-----NERDTree--------------
"open NERDTree whenn opening vim without file
command Tree NERDTreeToggle
autocmd vimenter * if !argc() | NERDTree | endif

"-----ALE-------------------
let g:ale_set_highlights = 0
let g:ale_sign_error = '▶'
let g:ale_sign_warning = '⚬'

highlight ALEErrorSign ctermfg=red
highlight ALEWarningSign ctermfg=blue

nnoremap gd :ALEGoToDefinition<CR>
nnoremap gr :ALEFindReferences<CR>

inoremap <expr> <Tab> pumvisible() ? '<C-n>' :                                                                                                                    
\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'


let g:OmniSharp_highlight_groups = {
\ 'ClassName': 'Type',
\}

let g:OmniSharp_server_use_mono = 1
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

let g:ale_completion_enabled = 1
let g:ale_linters = {
\  'python': ['pylsp'],
\  'cs': ['OmniSharp']
\}

"-------fix--------------------
autocmd! BufNewFile,BufRead *.frag,*.vert set ft=glsl
