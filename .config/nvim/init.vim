set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"keyboard-bind /usr/share/x11/xkb/symbols/pc
set termguicolors

"set sh as default shell
set shell=sh

" hey, i want to disable arrow keys
inoremap  <left>   <nop>
inoremap  <right>  <nop>
inoremap  <up>   <nop>
inoremap  <down>   <nop>
noremap   <left>   <nop>
noremap   <right>  <nop>
noremap   <up>  <nop>
noremap   <down>  <nop>

" display mode movement (for LaTeX Writing)
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" Snippet Movement
inoremap <A-j> <down>
inoremap <A-k> <up>

" PLUGIN
" Start vim-plug call
call plug#begin('~/.vim/plugged')

" List imported plugin
Plug 'arcticicestudio/nord-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'lervag/vimtex'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips'
Plug 'neomake/neomake'
Plug 'honza/vim-snippets'
Plug 'ap/vim-css-color'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" End vim-plug call
call plug#end()

" Plugin Load
" Enable Deoplete Completion
let g:deoplete#enable_at_startup = 1

" Enable Vimtex integration with deoplete
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

" settings for sumatraPDF
let g:vimtex_view_general_viewer = '/usr/bin/evince'
let g:vimtex_view_general_options
    \ = '--synctex-forward'


" Neomake Linting
call neomake#configure#automake('nrwi', 500)

" Nerdtree show hidden files
let NERDTreeShowHidden=1

" Lightline colorscheme
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

" Some basic tweaks
syntax on
set encoding=utf-8
set hidden
set noerrorbells
set nu rnu
set tabstop=4 softtabstop=4
set shiftwidth=4
set noshowmode
set expandtab
set smartindent
set smartcase
set noswapfile
set nobackup
set nowritebackup
set incsearch
set history=5000
set nocompatible
set showmatch
filetype plugin on
filetype indent on
set wildmode=longest,list,full
set wrap lbr
set breakindent
let mapleader = " "

autocmd BufNewFile,BufRead *.txt set ft=markdown
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" MAKE VIM EASIER TO OPERATE
" jk => exit insert mode
" backspace
" Activate mouse support
" Toogle Mouse
" Enter terminal mode
inoremap jk <Esc>
set backspace=indent,eol,start
set mouse=a
map <F3> :exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>
nnoremap <C-x> :vs term://bash<CR>

" Terminal Emulator Normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>

" LaTeX Shortcut
imap <C-d> \displaystyle 
imap <C-g> \includegraphics[width=200px]{
map <space><space> :call search("[{[$<(]")<CR>l
nnoremap <leader>p :VimtexCompile<CR>


" MAKE VIM TAB EASIER
map <C-t> :tabnew<CR>
nnoremap <A-l> :tabnext<CR>
nnoremap <A-h> :tabprevious<CR>

" MAKE VIM SPLIT DOESN'T SUCK
set splitbelow splitright

" SPLITS NAVIGATION
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"leader k to save file (k stands for keep)
nnoremap <leader>k :w<CR>

" SPLITS RESIZE
nnoremap <silent> <C-Left> :vertical resize +1<CR>
nnoremap <silent> <C-Right> :vertical resize -1<CR>
nnoremap <silent> <C-Up> :resize +1<CR>
nnoremap <silent> <C-Down> :resize -1<CR>

" Toogle Some Tools (File manager, Spell Check <id,en>)
nnoremap <leader>f :NERDTreeToggle<CR>
map <leader>s :setlocal spell! spelllang=en_us,id<CR>

" Copy Paste from System Clipboard
vnoremap <C-c> "+y
inoremap <C-v> "+P

" Persistent undo
set undodir=~/.vim/undodir/
set undofile

" Color Scheme (imported from vim-plug)
colorscheme nord


"MARKDOWN PREVIEW
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_page_title = '${name}'
let g:mkdp_filetypes = ['markdown']
nmap <C-m> <Plug>MarkdownPreview
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

