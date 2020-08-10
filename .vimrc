inoremap jk <Esc>
syntax on
set cursorline
set number
set hidden
set mouse=a
set visualbell
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Leader
let mapleader = " "

" Change cursor by mode (Iterm2)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let jt_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Improve splits
set splitbelow
set splitright
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <leader>q <C-W><C-Q>

" Shortcuts
nnoremap <leader>w :w<CR>
nnoremap <leader>r :source $MYVIMRC<CR> 
nnoremap <leader>g :Git
nnoremap <leader>f :FZF<CR>
nnoremap <leader>v :tabedit ~/.vimrc<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

" Faster commands
nnoremap : ;
nnoremap ; :

" Treat all .md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Set autoformatting of paragraphs
autocmd Filetype markdown setlocal formatoptions=aw2tq

" Auto install vim plug if it doesn't already exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-rbenv'
Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
set noshowmode
Plug 'airblade/vim-gitgutter'
set updatetime=500

" Initialize plugin system
call plug#end()

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
colorscheme nord

set termguicolors

if has('nvim')
" Terminal
  nnoremap <leader>t :vsplit term://<CR>
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
endif

