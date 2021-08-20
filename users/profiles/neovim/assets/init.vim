" ===============================================
" init.vim --- Vim :: Init
" ===============================================


" Sets no backup
set nobackup       " no backup files
set noswapfile     " no swap files
set nowritebackup  " no write backup file
set noundofile     " no undo files

" Sets disable vi mode
set nocompatible

" Sets reserved history lines
set history=240

" Sets filetype plugin on
filetype plugin on
filetype indent on

" Sets map leader
let mapleader = ";"

" Sets basic encoding
set encoding=utf8

" Sets plain text format
set syntax=on                     " Syntax on
set expandtab                     " Replace <tab> as <space>
set shiftwidth=4                  " Indent width
set tabstop=4                     " Display tab width
set softtabstop=4                 " Tune tab on vim insert mode
set backspace=2                   " Backspace with
set ruler                         " Open status bar ruler
set number                        " Show line number
set showmatch                     " Highlight matched brackets
set matchtime=1                   " Brackets highlight residence time

" Sets status line
set laststatus=2                  " Show status line


