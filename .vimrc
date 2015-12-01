let mapleader = "\<Space>"

" for Vundle
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

" for Theme
syntax enable
"colorscheme molokai

" for vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_inactive_collapse=1
let g:airline#extensions#tabline#enabled = 0
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'v'  : 'V',
    \ 'V'  : 'V-L',
    \ '^V' : 'V-B',
    \ 'c'  : 'CMD',
    \ 's'  : 'S',
    \ 'S'  : 'S-L',
    \ '^S' : 'S-B',
    \ 't'  : 'T',
    \ }

" my keymap (the pipe is not part of the command, it just enables inline comments)
inoremap jk <Esc>|                                  "exit insert mode
nnoremap ss :w<CR>|                                 "save file from normal mode
nnoremap <C-j>s :%!python -m json.tool|             "pretty print json"
nnoremap <C-h> <C-w>h|                              "switch split left
nnoremap <C-j> <C-w>j|                              "switch split down
nnoremap <C-k> <C-w>k|                              "switch split up
nnoremap <C-l> <C-w>l|                              "switch split right
map <leader>x :bd<CR>|                              "delete buffer
map <leader>c :!git ctags<CR><CR>|                  "re/create ctags
nmap <silent> <leader><Space> :FixWhitespace<CR>|   "delete trailing whitespace
"ctags go to definition
"ctags go back
"nav buffers in single pane

" look and feel
set number
set ruler
set colorcolumn=100
highlight ColorColumn ctermbg=8
set nowrap

" tabs converted to 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" system clipboard support
set clipboard=unnamed

" misc
set noswapfile
set scrolloff=5

" for Ctags
set tags=./.git/tags,tags

" for CtrlP
let g:ctrlp_show_hidden=1
set wildignore+=*.png,*.jpg,*.pdf,*.swf
let g:ctrlp_custom_ignore = '\.git$\|\.o$\|\.app$\|\.beam$\|\.dSYM\|\.ipa$\|\.csv\|tags\|public\/images$\|public\/uploads$\|log\|tmp$\|source_maps\|app\/assets\/images\|test\/reports\|node_modules\|bower_components\|dist'
let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

" for Silver Searcher
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif
