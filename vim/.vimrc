"-----behavior-------------
set nocompatible
filetype plugin on
filetype indent on
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab shiftround textwidth=79 
set autoindent

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

"-----YouCompleteMe----------
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/.global_extra_conf.py'
