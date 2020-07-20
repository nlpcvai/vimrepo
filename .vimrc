set nocompatible              " be iMproved, required
syntax enable

"---------------Mappings----------------"

let mapleader = ','
imap jk <ESC>
nmap ,ev :tabedit ~/.vimrc<cr>

set backspace=indent,eol,start

set number


inoremap <C-u> <esc>gUiwea

"---------------Auto-Commands----------------
autocmd BufWritePost .vimrc source %

