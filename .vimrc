inoremap jk <Esc>
syntax on
set cursorline
set number

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Leader
let mapleader = " "

" Improve splits
set splitbelow
set splitright
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>q <C-W><C-Q>

" Shortcuts
nnoremap <leader>w :w<CR>
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>f :FZF<CR>
nnoremap <leader>ve :e $MYVIMRC<CR>
map <leader>nf :NERDTreeFocus<CR>
map <leader>nt :NERDTreeToggle<CR>

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
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
set updatetime=100

" Initialize plugin system
call plug#end()

colorscheme nord
set termguicolors

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
