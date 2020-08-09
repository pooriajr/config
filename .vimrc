inoremap jk <Esc>
syntax on
set cursorline
set number
set hidden

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Leader
let mapleader = " "

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
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>v :tabedit ~/.vimrc<CR>
map <leader>nf :NERDTreeFocus<CR>
map <leader>nt :NERDTreeToggle<CR>

" Terminal
if has('nvim')
  nnoremap <leader>t :vsplit term://<CR>
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
endif

" Treat all .md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Set autoformatting of paragraphs
autocmd Filetype markdown setlocal formatoptions=aw2tq

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'preservim/nerdtree'
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
set noshowmode
Plug 'airblade/vim-gitgutter'
set updatetime=100

" Initialize plugin system
call plug#end()

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

colorscheme nord
set termguicolors
