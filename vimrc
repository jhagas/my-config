set term=xterm

" Start vim-plug call
call plug#begin('~/.vim/plugged')

" List imported plugin
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'preservim/nerdtree'

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
      \ 'colorscheme': 'nord',
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

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set spell spelllang=id,en

imap jk <Esc>
vmap ii <Esc>
set backspace=indent,eol,start

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set noshowmode

map <F3> :set mouse=a<CR>
map <F4> :set mouse=c<CR>
map <F12> :Goyo<CR>
nnoremap <F11> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1


" Persistent undo
set undodir=~/.vim/undodir/
set undofile
let g:undotree_WindowLayout = 2


" Markdown Edits
    let g:vim_markdown_autowrite = 1
    let g:vim_markdown_no_extensions_in_markdown = 1
    let g:vim_markdown_conceal = 0
    let g:vim_markdown_override_foldtext = 0
    let g:vim_markdown_folding_disabled = 1


" Color Scheme (imported from vim-plug)
colorscheme nord

