"pathogen
execute pathogen#infect()
execute pathogen#helptags()
let b:lint_disabled=1

"swap file dir
set dir=~/.swp

"tabs
set tabstop=2
set shiftwidth=2
set expandtab

"col guide
set cc=76
set number
set ruler

syntax on
syntax enable
filetype plugin on

"colors
set t_Co=256
set bg=dark
colo molokai

"search
set nohlsearch

"saved commands
set viminfo='20,\"1000

"function! JSX()
"  0r ~/.vim/skeleton/skeleton.jsx
"  2
"endfunction
"
"function! HTML()
"  0r ~/.vim/skeleton/skeleton.html
"  2
"endfunction
"
"function! JS()
"  0r ~/.vim/skeleton/skeleton.js
"endfunction

au BufNewFile,BufRead *.md set filetype=markdown
"au BufNewFile,BufRead *.jsx set filetype=jsx
"
"au BufNewFile *.jsx call JSX()
"au BufNewFile *.js call JS()
"au BufNewFile *.html call HTML()

nnoremap <F5> "=strftime("%T ")<CR>P
inoremap <F5> <C-R>=strftime("%T ")<CR>
