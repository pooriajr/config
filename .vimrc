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
nnoremap <leader>/ :nohl<CR>

inoremap <C-d> <Del>

vnoremap <leader>c "*y

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

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tweekmonster/fzf-filemru'
let g:fzf_history_dir = '~/.local/share/fzf-history'
nnoremap <leader>r :Rg<CR> 
nnoremap <leader>f :FilesMru --tiebreak=end<CR>
nnoremap <leader>l :BLines<CR>

" NerdTree
Plug 'preservim/nerdtree'
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

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

" Formatting
Plug 'tpope/vim-surround'
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('%')} = "{% \r %}"

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
Plug 'tpope/vim-rbenv'

" Git
Plug 'tpope/vim-fugitive'
nnoremap <leader>g :Git 

Plug 'airblade/vim-gitgutter'
set updatetime=500 " update gitgutter every 500 milisecond
noremap <leader>hh :GitGutterToggle<CR>

Plug 'junegunn/gv.vim'

" Aesthetics
set termguicolors
Plug 'cocopon/iceberg.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'psliwka/vim-smoothie'

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
" Plug 'tpope/vim-liquid'
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

" Prose, using Goyo as 'Prose Mode'
Plug 'junegunn/goyo.vim'
Plug 'preservim/vim-wordy'

function! StartProse()
  setlocal linebreak
  setlocal wrap
  nnoremap <buffer> j gj
  nnoremap <buffer> k gk
  nnoremap <buffer> $ g$
  nnoremap <buffer> 0 g0
  inoremap <buffer> . .<c-g>u
  inoremap <buffer> ! !<c-g>u
  inoremap <buffer> ? ?<c-g>u
  inoremap <buffer> , ,<c-g>u
  inoremap <buffer> ; ;<c-g>u
  inoremap <buffer> : :<c-g>u
endfunction

function! StopProse()
  setlocal nolinebreak
  setlocal nowrap
  unmap <buffer> j
  unmap <buffer> k
  unmap <buffer> $
  unmap <buffer> 0
  iunmap <buffer> .
  iunmap <buffer> !
  iunmap <buffer> ?
  iunmap <buffer> ,
  iunmap <buffer> ;
  iunmap <buffer> :
endfunction

autocmd! User GoyoEnter nested call StartProse()
autocmd! User GoyoLeave nested call StopProse()
nnoremap <leader>p :Goyo<CR>

" Settings
Plug 'tpope/vim-sensible'

" Other
Plug 'vim-scripts/restore_view.vim'
Plug 'rstacruz/vim-xtract'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tommcdo/vim-exchange'
Plug 'mbbill/undotree'
nnoremap <leader>u :UndotreeToggle<CR>
Plug 'szw/vim-maximizer'
nnoremap <leader>o :MaximizerToggle<CR>

" Autocompletion
Plug 'jiangmiao/auto-pairs'
Plug 'https://github.com/lifepillar/vim-mucomplete'
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1
" Pressing down arrow will try to chain completions like ctr-x ctr-p
imap <expr> <down> mucomplete#extend_fwd("\<down>")

" Initialize plugin system
call plug#end()

" this has to be down here or it doesnt work with vim-plug 🤷‍♂️
colorscheme iceberg
let macvim_skip_colorscheme = 1
set background=dark

" That's all, folks!
