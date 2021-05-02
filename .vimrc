set smartcase
set ignorecase
syntax on
set cursorline
set hidden
set mouse=a
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set shiftround 
set undofile
set undodir=$HOME/.vim/undo
set redrawtime=10000 "prevents broken syntax highlighting on large files
autocmd BufWritePost * :syntax sync fromstart "refresh syntax highlighting on save

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
nnoremap j gj
nnoremap k gk
nnoremap Q @@
nnoremap <leader>g :Git 
nnoremap <leader>r :Rg<CR> 
nnoremap <leader>f :FilesMru --tiebreak=end<CR>
nnoremap <leader>vv :tabedit ~/.vimrc<CR>
nnoremap <leader>vr :source $MYVIMRC<CR> 
nnoremap <leader>vp :PlugInstall<CR>
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>/ :nohl<CR>
nnoremap !! :!!<CR>
nnoremap <leader>t :terminal<CR>
inoremap <C-d> <Del>
vnoremap <leader>c "*y
nnoremap <C-N><C-N> :set invnumber<CR>


" Terminal
tnoremap <Esc><Esc> <C-\><C-n> 
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
Plug 'tweekmonster/fzf-filemru'
Plug 'preservim/nerdtree'
Plug 'easymotion/vim-easymotion'
"easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)

"Formatting
Plug 'tpope/vim-surround'
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('-')} = "<% \r %>"
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/sideways.vim'
nnoremap H :SidewaysLeft<cr>
nnoremap L :SidewaysRight<cr>
omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

"Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rbenv'

"Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
set updatetime=500 "update gitgutter every 500 milisecond
noremap <leader>hh :GitGutterToggle<CR>

"Aesthetics
Plug 'itchyny/lightline.vim'
set noshowmode "hide the default status line since we have lightline
Plug 'cocopon/iceberg.vim'
set termguicolors
Plug 'junegunn/goyo.vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'sheerun/vim-polyglot'

"Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'whatyouhide/vim-textobj-erb' 

"UNIX
Plug 'tpope/vim-eunuch'

"Settings
Plug 'tpope/vim-sensible'

"Other
Plug 'dbeniamine/cheat.sh-vim'
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/restore_view.vim'

" Initialize plugin system
call plug#end()

let g:lightline = {
      \ 'colorscheme': 'iceberg',
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
  let cwd = substitute(getcwd(),$HOME,'~','')
  let path = expand('%f')
  return cwd . '/' . path
endfunction

colorscheme iceberg

"open fzf in popover window
let g:fzf_layout = {  'window': { 'yoffset': 1 ,'width': 0.9, 'height': 0.4 } }

