" This is pretty sparse; actually, I've been using `ed` exclusively
" the last couple of years.
"
" https://www.gnu.org/software/ed/
"

" Start Pathogen
" See https://github.com/tpope/vim-pathogen
execute pathogen#infect()
execute pathogen#helptags()

" Set a standard swap directory to avoid leaving swap files
" all over the file system.
set dir=~/.vim/.swp

syntax on
syntax enable
filetype plugin on

" Set the preferred color options.
set t_Co=256
set bg=dark
colo molokai

" I hate highlighted search, so messy.
set nohlsearch

" Insert a timestamp with <F5>
nnoremap <F5> "=strftime("%T ")<CR>P
inoremap <F5> <C-R>=strftime("%T ")<CR>
