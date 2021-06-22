" Settings
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
set nomodeline
set undofile
syntax on

" Leader
let mapleader = " "

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
nnoremap <silent> <leader><Esc> :nohl<CR>

" Forward deletion
inoremap <C-d> <Del>

" Copy highlighted text to clipboard https://github.com/neovim/neovim/issues/5052#issuecomment-232083842
vnoremap <M-c> "+y

" Meta
nnoremap <leader>vv :tabedit ~/r/config/vimrc<CR>
nnoremap <leader>vr :source $MYVIMRC<CR> 
nnoremap <leader>vp :PlugInstall<CR>

" Auto install vim plug if it doesn't already exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Open help pages in a vertical split
augroup vertical_help
  autocmd!
  autocmd FileType help
        \ setlocal bufhidden=unload |
        \ wincmd L |
        \ vertical resize 79
augroup END

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" FZF (both lines needed)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let g:fzf_history_dir = '~/.local/share/fzf-history'
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>h :History<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>/ :Rg<Space>
nmap <Leader>? :Helptags!<CR>
nmap <Leader>: :History:<CR>

" NerdTree
Plug 'preservim/nerdtree'
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>


" Motion
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_do_mapping = 0 " Disable default mappings
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
Plug 'ggandor/lightspeed.nvim'

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
Plug 'jiangmiao/auto-pairs'
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
Plug 'tpope/vim-rbenv'

" Git
Plug 'tpope/vim-fugitive'
nnoremap <leader>gg :call ToggleFugitiveWindow()<CR>
function! ToggleFugitiveWindow()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        :Git
    endif
endfunction
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gs :Git status<CR>
nnoremap <leader>gl :GV<CR>

Plug 'mhinz/vim-signify'
set updatetime=100
nnoremap <leader>hd :SignifyDiff<cr>
nnoremap <leader>hp :SignifyHunkDiff<cr>
nnoremap <leader>hu :SignifyHunkUndo<cr>

" hunk jumping
nmap <leader>hj <plug>(signify-next-hunk)
nmap <leader>hk <plug>(signify-prev-hunk)

" hunk text object
omap ih <plug>(signify-motion-inner-pending)
xmap ih <plug>(signify-motion-inner-visual)
omap ah <plug>(signify-motion-outer-pending)
xmap ah <plug>(signify-motion-outer-visual)

" :GV to open commit browser
Plug 'junegunn/gv.vim'

" Aesthetics
set termguicolors
Plug 'arcticicestudio/nord-vim'
Plug 'machakann/vim-highlightedyank'
Plug 'psliwka/vim-smoothie'

" Plug 'Konfekt/FastFold'

" Lightline
Plug 'itchyny/lightline.vim'
" hide the default status line since we have lightline
set noshowmode 
let g:lightline = {
      \ 'colorscheme': 'nord',
      \'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
        \ },
        \ 'component_function': {
          \   'filename': 'FileRelativeToRepo',
          \   'gitbranch': 'FugitiveHead'
          \ }
          \ }

function! FileRelativeToRepo()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

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

" UNIX Shell Commands
Plug 'tpope/vim-eunuch'

" Prose, using Goyo as 'Prose Mode'
Plug 'junegunn/goyo.vim'

function! StartProse()
  setlocal linebreak
  setlocal wrap
  setlocal spell
  nnoremap <buffer> j gj
  nnoremap <buffer> k gk
  vnoremap <buffer> j gj
  vnoremap <buffer> k gk
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

" Other
Plug 'rstacruz/vim-xtract'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'mbbill/undotree'
  nnoremap <leader>u :UndotreeToggle<CR>
Plug 'szw/vim-maximizer'
  nnoremap <leader>o :MaximizerToggle<CR>
Plug 'christoomey/vim-tmux-navigator'

" Buffer Bar
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " use <tab> for trigger completion and navigate to the next complete item
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

  " gd to go to definition definition
  nmap <silent> gd <Plug>(coc-definition)


" Initialize plugin system
call plug#end()

" this has to be down here or it doesnt work with vim-plug 🤷‍♂️
colorscheme nord

" That's all, folks!
