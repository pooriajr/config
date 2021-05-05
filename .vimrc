set smartcase
set ignorecase
set hlsearch
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

syntax on

" Leader
let mapleader = " "

" Change cursor by mode in Iterm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Improve splits
set splitbelow
set splitright
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l

" Shortcuts for standard actions
nnoremap <leader>q <C-W><C-Q>
nnoremap <leader>w :w<CR>
nnoremap j gj
nnoremap k gk
nnoremap <leader>/ :nohl<CR>
inoremap <C-d> <Del>
vnoremap <leader>c "*y
nnoremap !! :!!<CR>

" Meta Shortcuts
nnoremap <leader>vv :tabedit ~/.vimrc<CR>
nnoremap <leader>vr :source $MYVIMRC<CR> 
nnoremap <leader>vp :PlugInstall<CR>

" Terminal
nnoremap <leader>t :terminal<CR>
tnoremap <Esc><Esc> <C-\><C-n>
tnoremap <C-j> <C-W>j
tnoremap <C-k> <C-W>k
tnoremap <C-l> <C-W>l

" Auto install vim plug if it doesn't already exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'
nnoremap <leader>r :Rg<CR> 
nnoremap <leader>f :FilesMru --tiebreak=end<CR>

" NerdTree
Plug 'preservim/nerdtree'
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Easymotion
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>l <Plug>(easymotion-lineforward)

" Formatting
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
nmap <leader>si <Plug>SidewaysArgumentInsertBefore
nmap <leader>sa <Plug>SidewaysArgumentAppendAfter
nmap <leader>sI <Plug>SidewaysArgumentInsertFirst
nmap <leader>sA <Plug>SidewaysArgumentAppendLast

" Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rbenv'

" Git
Plug 'tpope/vim-fugitive'
nnoremap <leader>g :Git 

Plug 'airblade/vim-gitgutter'
set updatetime=500 " update gitgutter every 500 milisecond
noremap <leader>hh :GitGutterToggle<CR>

" Aesthetics
set termguicolors
Plug 'cocopon/iceberg.vim'

Plug 'Konfekt/FastFold'
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#161821   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#1E2131 ctermbg=4

" Lightline
Plug 'itchyny/lightline.vim'
" hide the default status line since we have lightline
set noshowmode 
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

" Language Support
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-liquid'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Text objects
Plug 'kana/vim-textobj-user'
" e entire file
Plug 'kana/vim-textobj-entire'
" r ruby block
Plug 'nelstrom/vim-textobj-rubyblock'
" e erb tag
Plug 'whatyouhide/vim-textobj-erb' 
" i indent level
Plug 'michaeljsmith/vim-indent-object'

" UNIX
Plug 'tpope/vim-eunuch'

" GOYO
Plug 'junegunn/goyo.vim'
nnoremap <leader>G :Goyo<CR>

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  set linebreak
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  set nolinebreak
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" Settings
Plug 'tpope/vim-sensible'

" Other
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/restore_view.vim'
Plug 'ackyshake/VimCompletesMe'
Plug 'rstacruz/vim-xtract'
Plug 'psliwka/vim-smoothie'

" Initialize plugin system
call plug#end()

" this has to be down here or it doesnt work with vim-plug 🤷‍♂️
colorscheme iceberg
let macvim_skip_colorscheme = 1
set background=dark

" That's all, folks!
