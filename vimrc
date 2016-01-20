"Plugin 'vim-jp/vim-go-extra'
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Install vim-go plugin for golang
Plugin 'fatih/vim-go'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" " Put your non-Plugin stuff after this line

syntax on
filetype indent plugin on
set ts=4
set expandtab
set shiftwidth=4
set softtabstop=4
set modeline
"autocmd FileType python setlocal foldmethod=indent

set hlsearch
set incsearch

set nu

set mouse=a

" Display status line position
set ruler

" Have vim jump to the last position when reopening a file
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Find trailing whitespace
highlight ExtraWhitespace ctermbg=yellow guibg=yellow
match ExtraWhitespace '\s\+$'

" Strip trailing whitespace when writing buffer
"autocmd BufWritePre <buffer> :%s/\s\+$//e

" Defind command to trim trailing whitespace
command RTW :%s/\s\+$//e

" Define pylint as compiler of *.py
au FileType python set makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
au FileType set errorformat=%f:%l:\ %m

"########################## Golang setting ################################
let g:go_fmt_options = '--tabs=false -tabwidth=4'
