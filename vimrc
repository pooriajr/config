" Standard Settings
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
  set foldmethod=indent
  set foldlevel=99

" Leader
let mapleader = " "

" Improve splits
  set splitbelow
  set splitright

" Copy highlighted text to clipboard https://github.com/neovim/neovim/issues/5052#issuecomment-232083842
vnoremap <M-c> "+y

" Forward deletion
inoremap <C-d> <Del>

" Meta
  nnoremap <leader>vv :e ~/r/config/vimrc<CR>
  nnoremap <leader>vr :source $MYVIMRC<CR> 
  nnoremap <leader>vp :PlugInstall<CR>

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

" File Explorer
Plug 'preservim/nerdtree'
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

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

Plug 'junegunn/vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

" Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
  set updatetime=100
  nnoremap <leader>hd :SignifyDiff<cr>
  nnoremap <leader>hp :SignifyHunkDiff<cr>
  nnoremap <leader>hu :SignifyHunkUndo<cr>

" Aesthetics
set termguicolors
Plug 'machakann/vim-highlightedyank'
Plug 'psliwka/vim-smoothie'
Plug 'ryanoasis/vim-devicons'
Plug 'arcticicestudio/nord-vim'

" Nord Overrides
  augroup nord-theme-overrides
    autocmd!
    autocmd ColorScheme nord highlight Folded guibg=#313745 guifg=#556076
  augroup END

" Custom Fold Text
  function! CustomFold()
      let line = getline(v:foldstart)
      let foldedlinecount = v:foldend - v:foldstart + 1
      return printf('  %-3d%s', foldedlinecount, line)
  endfunction

  set foldtext=CustomFold()
  set fillchars=fold:\  

" Lightline + Bufferline
Plug 'itchyny/lightline.vim'
set noshowmode " hide the default status line since we have lightline
let g:lightline = {
  \ 'colorscheme': 'nord',
  \'active': {
  \   'left': [ [ 'mode', 'paste' ], 
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'inactive': {
  \   'left': [ [ 'filename'] , ['modified' ] ],
  \   'right': []
  \ },
  \ 'tabline': {
  \   'left': [ ['buffers'] ]
  \ },
  \ 'component_function': {
  \   'filename'  : 'FileRelativeToRepo',
  \   'gitbranch' : 'FugitiveHead'
  \ },
  \ 'component_expand' : { 'buffers': 'lightline#bufferline#buffers' },
  \ 'component_type'   : { 'buffers': 'tabsel' }
  \ }

function! FileRelativeToRepo()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" Bufferline
  Plug 'mengelbrecht/lightline-bufferline'
  set showtabline=2

  let g:lightline#bufferline#enable_devicons = 1
  let g:lightline#bufferline#unnamed = '¯\_(ツ)_/¯'
  "jump to buffer by number
    nmap <Leader>1 <Plug>lightline#bufferline#go(1)
    nmap <Leader>2 <Plug>lightline#bufferline#go(2)
    nmap <Leader>3 <Plug>lightline#bufferline#go(3)
    nmap <Leader>4 <Plug>lightline#bufferline#go(4)
    nmap <Leader>5 <Plug>lightline#bufferline#go(5)
    nmap <Leader>6 <Plug>lightline#bufferline#go(6)
    nmap <Leader>7 <Plug>lightline#bufferline#go(7)
    nmap <Leader>8 <Plug>lightline#bufferline#go(8)
    nmap <Leader>9 <Plug>lightline#bufferline#go(9)
    nmap <Leader>0 <Plug>lightline#bufferline#go(10)
  "delete buffer by number
    nmap <Leader>d1 <Plug>lightline#bufferline#delete(1)
    nmap <Leader>d2 <Plug>lightline#bufferline#delete(2)
    nmap <Leader>d3 <Plug>lightline#bufferline#delete(3)
    nmap <Leader>d4 <Plug>lightline#bufferline#delete(4)
    nmap <Leader>d5 <Plug>lightline#bufferline#delete(5)
    nmap <Leader>d6 <Plug>lightline#bufferline#delete(6)
    nmap <Leader>d7 <Plug>lightline#bufferline#delete(7)
    nmap <Leader>d8 <Plug>lightline#bufferline#delete(8)
    nmap <Leader>d9 <Plug>lightline#bufferline#delete(9)
    nmap <Leader>d0 <Plug>lightline#bufferline#delete(10)
  "delete current buffer (without closing pane)
  "tab to switch buffer
  nnoremap <Tab> :bnext<CR>
  nnoremap <S-Tab> :bprevious<CR>

" Text objects
  Plug 'kana/vim-textobj-user'
  " e entire file
  Plug 'kana/vim-textobj-entire'
  " r ruby block
  Plug 'nelstrom/vim-textobj-rubyblock'
  " E erb tag
  Plug 'whatyouhide/vim-textobj-erb' 
  " i indent level
  Plug 'michaeljsmith/vim-indent-object'
  " c comment
  Plug 'glts/vim-textobj-comment'

" For using vim in browser
Plug 'subnut/nvim-ghost.nvim', {'do': ':call nvim_ghost#installer#install()'}

" Initialize plugin system
call plug#end()

" this has to be down here or it doesnt work with vim-plug 🤷‍♂️
colorscheme nord

" That's all, folks!
