set nocompatible              " be iMproved, required
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-repeat'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()
" plugin custom start
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

autocmd FileType html,css,scss imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss EmmetInstall


" plugin custom end
syntax enable
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround

set enc=utf8

set foldmethod=marker

set foldmarker={{{,}}}

"set wrap
set noswapfile
set nobackup

"set background=light
"set linebreak
"set showbreak=>\

set scrolloff=5
set wildmenu
set nocursorline

set incsearch
set hlsearch
set showcmd
set ruler
set backspace=indent,eol,start

set number relativenumber

nnoremap / /\v
vnoremap / /\v



"---------------Mappings----------------"

let mapleader = ','
imap jk <ESC>
nmap ,ev :tabedit ~/.vimrc<cr>
nnoremap <silent> <F2> :NERDTreeToggle<Enter>


inoremap <C-u> <esc>gUiwea

"---------------Auto-Commands----------------
autocmd BufWritePost .vimrc source %

autocmd BufRead,BufWritePre *.html normal gg=G
autocmd Filetype html nnoremap <leader>c I<!--<esc>A--><esc>
autocmd Filetype python nnoremap <leader>r :!python3 %<esc>



inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {<CR>}<ESC>O
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

augroup JavaScriptCmds
	"disable other autocmd out group
	autocmd!
	autocmd Filetype javascript nnoremap <leader>r :!node %<cr>
	autocmd Filetype javascript nnoremap <leader>c I//<esc>
	
augroup END

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!java %<"
    elseif &filetype == 'sh'
        :!sh %
    elseif &filetype == 'python'
        :!python3 %
    elseif &filetype == 'go'
        :!go run %
    endif
endfunc

""augroup ShellCmds
""	autocmd!
""	autocmd Filetype sh call setline(1,"\#!/bin/bash") 
""augroup END
