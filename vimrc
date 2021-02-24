set term=xterm

" Start vim-plug call
call plug#begin('~/.vim/plugged')

" List imported plugin
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'
Plug 'ap/vim-css-color'

" End vim-plug call
call plug#end()

" Some basic tweaks
syntax on
let mapleader=" "
set noerrorbells
set nu rnu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smartcase
set noswapfile
set nobackup
set incsearch
set nowrap
set nofoldenable
set history=5000
set nocompatible
set lazyredraw
set showmatch
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


filetype plugin on
filetype indent on
set encoding=utf-8
set wildmenu
set wildmode=longest,list,full
set laststatus=2

if !has('gui_running')
    set t_Co=256
endif

set termguicolors

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

imap jk <Esc>
vmap ii <Esc>
set backspace=indent,eol,start

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set noshowmode

map <F3> :exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>
map <F12> :Goyo<CR>
nnoremap <F11> :NERDTreeToggle<CR>
map <F4> :exec &spelllang!=""? "set spell spelllang=" : "set spell spelllang=id,en"<CR>

let NERDTreeShowHidden=1


" Persistent undo
set undodir=~/.vim/undodir/
set undofile
let g:undotree_WindowLayout = 2

" Color Scheme (imported from vim-plug)
colorscheme nord
