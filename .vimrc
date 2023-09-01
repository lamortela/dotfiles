" Disable Vi compatibility (this is nvim's default)
set nocompatible

let mapleader = "\<Space>"
set encoding=utf-8
let g:ale_completion_enabled = 1

" install vim-plug automatically
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-fugitive'                | "git wrapper"
Plug 'airblade/vim-gitgutter'            | "git diff in gutter"

Plug 'vim-airline/vim-airline'           | "status/tabline"
Plug 'vim-airline/vim-airline-themes'    | "vim-airline themes"

Plug 'ctrlpvim/ctrlp.vim'                | "old fuzzy finder"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'                  | "new fuzzy finder"
Plug 'tpope/vim-surround'                | "parenthesizing"
Plug 'bronson/vim-trailing-whitespace'   | "highlights trailing whitespace"

Plug 'dense-analysis/ale'                | "syntax checker"
Plug 'pangloss/vim-javascript'           | "JS indentation and syntax"
Plug 'leafgarland/typescript-vim'        | "typescript syntax highlighting"

Plug 'gertjanreynaert/cobalt2-vim-theme' | "Cobalt2 color scheme"

call plug#end()

filetype plugin indent on
syntax enable

" appearance
colors cobalt2
set visualbell

" for vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='simple'
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

" rulers and such
set number
set ruler
set colorcolumn=90
highlight ColorColumn ctermbg=8
set showcmd
set cursorline

" tabs and white space
set nowrap
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set nojoinspaces

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" system clipboard support
set clipboard=unnamed

" misc
set backspace=indent,eol,start
set noswapfile
set scrolloff=5
set nostartofline


" for Ctags
set tags=./.git/tags,tags

" for CtrlP
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:50'
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden=1

" for ripgrep
if executable('rg')
  " use rg over grep
  set grepprg=rg\ --vimgrep\ --smart-case\ --follow\ --hidden

  " use rg in CtrlP for listing files
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'

  " rg is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"for ALE
let g:ale_lint_on_save = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'eslint']
\}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint']
\}

" my keymap (don't put whitespace in front of pipes, or it all breaks)
inoremap fd <Esc>|                                 "exit insert mode
nnoremap sa :w<CR>|                                "save file from normal mode
nnoremap <leader>js :%!python3 -m json.tool<CR>|   "pretty print json"
nnoremap <C-h> <C-w>h|                             "switch split left
nnoremap <C-j> <C-w>j|                             "switch split down
nnoremap <C-k> <C-w>k|                             "switch split up
nnoremap <C-l> <C-w>l|                             "switch split right
map <leader>x :bd<CR>|                             "delete buffer
nnoremap <C-c> :bp\|bd #<CR>|                      "delete buffer, keep split
map <leader>c :!git ctags<CR><CR>|                 "re/create ctags
nmap <silent> <leader><Space> :nohlsearch<CR>|     "clear search highlighting
nnoremap <silent> <C-f> :Files<CR>|                "search files with fzf"
nnoremap <silent> <leader>f :Rg<CR>|               "search inside files with ripgrep"
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>|     "grep word under cursor
"ctags go to definition
"ctags go back
"nav buffers in single pane
