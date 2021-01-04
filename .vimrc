set smartcase
set ignorecase
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
set hlsearch
set linebreak
set undofile
set undodir=$HOME/.vim/undo

" Leader
let mapleader = " "

" Change cursor by mode in Iterm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Improve splits
set splitbelow
set splitright
nnoremap <leader>w :w<CR>
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <leader>q <C-W><C-Q>

" Shortcuts
nnoremap Q @@
nnoremap <leader>r :source $MYVIMRC<CR> 
nnoremap <leader>g :Git 
nnoremap <leader>f :FZF<CR>
nnoremap <leader>v :tabedit ~/.vimrc<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>/ :nohl<CR>
nnoremap !! :!!<CR>
nnoremap <leader>t :terminal<CR>
nnoremap <leader>c :%y*<CR>

" Terminal
tnoremap <Esc><Esc> <C-\><C-n> 
tnoremap <C-h> <C-W>h
tnoremap <C-j> <C-W>j
tnoremap <C-k> <C-W>k
tnoremap <C-l> <C-W>l

" Treat all .md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Auto install vim plug if it doesn't already exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

"Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ludovicchabant/vim-gutentags'

"Formatting
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim'

"Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rbenv'

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
set updatetime=500 "update gitgutter every 500 milisecond

"Aesthetics
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
set noshowmode "hide the default status line since we have lightline
Plug 'junegunn/goyo.vim'

"Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'whatyouhide/vim-textobj-erb'

"Settings
Plug 'tpope/vim-sensible'

" Initialize plugin system
call plug#end()

let g:lightline = {
      \ 'colorscheme': 'nord',
      \'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'FugitiveHead'
      \ }
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

colorscheme nord

"open fzf in popover window
let g:fzf_layout = {  'window': { 'yoffset': 1 ,'width': 0.5, 'height': 0.4 } }

set termguicolors

"prevent broken syntax highlighting
autocmd BufEnter * :syntax sync fromstart
