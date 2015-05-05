"for Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'sickill/vim-monokai'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tpope/vim-rails'

call vundle#end()

filetype plugin indent on

"for Theme
syntax enable
"colorscheme molokai

"for vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1

"personal
set number
set ruler
set colorcolumn=81

"tabs converted to 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2
