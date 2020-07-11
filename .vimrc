set nowrap
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set laststatus=2
set showmode
colorscheme delek
set cursorline
set hls is
set tabstop=4
set shiftwidth=4
set expandtab

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" Themes
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

" Keyboard shortcuts
let mapleader=" " 
nmap <Leader>nt :NERDTreeFind<CR>
