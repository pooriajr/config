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
  nnoremap <C-h> <C-W>h
  nnoremap <C-j> <C-W>j
  nnoremap <C-k> <C-W>k
  nnoremap <C-l> <C-W>l

" Shortcuts for standard actions
  nnoremap <leader>q <C-W><C-Q>
  nnoremap <leader>w :w<CR>
  nnoremap <silent> <leader><Esc> :nohl<CR>
  " Copy highlighted text to clipboard https://github.com/neovim/neovim/issues/5052#issuecomment-232083842
  vnoremap <M-c> "+y

" Forward deletion
inoremap <C-d> <Del>

" Meta
  nnoremap <leader>vv :e ~/r/config/vimrc<CR>
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

" File Explorer
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

Plug 'junegunn/gv.vim'
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

" Aesthetics
set termguicolors
Plug 'arcticicestudio/nord-vim'

" Nord Overrides
  augroup nord-theme-overrides
    autocmd!
    autocmd ColorScheme nord highlight Folded guibg=#353c4a guifg=#556076
  augroup END

Plug 'machakann/vim-highlightedyank'
Plug 'psliwka/vim-smoothie'
Plug 'ryanoasis/vim-devicons'

" Custom Fold Text
  function! MyFoldText()
      let line = getline(v:foldstart)

      let nucolwidth = &fdc + &number * &numberwidth
      let windowwidth = winwidth(0) - nucolwidth - 3
      let foldedlinecount = v:foldend - v:foldstart + 1

      " expand tabs into spaces
      let onetab = strpart('          ', 0, &tabstop)
      let line = substitute(line, '\t', onetab, 'g')

      let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
      let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
      return '  '. foldedlinecount . line . ' ' . repeat(" ",fillcharcount)
  endfunction
  set foldtext=MyFoldText()

" Lightline + Bufferline
Plug 'itchyny/lightline.vim'
set noshowmode " hide the default status line since we have lightline
let g:lightline = {
  \ 'colorscheme': 'nord',
  \'active': {
  \   'left': [ [ 'yy', 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'tabline': {
  \   'left': [ ['buffers'] ],
  \   'right': [ ['close'] ]
  \ },
  \ 'component_function': {
  \   'filename'  : 'FileRelativeToRepo',
  \   'gitbranch' : 'FugitiveHead'
  \ },
  \ 'component_expand' : { 'buffers': 'lightline#bufferline#buffers' },
  \ 'component_type'   : { 'buffers': 'tabsel' },
  \ 'separator'        : { 'left': '', 'right': '' },
  \ 'subseparator'     : { 'left': '', 'right': '' },
  \ 'component'        : { 'yy': '☯' }
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
  Plug 'moll/vim-bbye'
  nmap <Leader>dd :Bdelete<CR>
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
Plug 'folke/which-key.nvim'
Plug 'chaoren/vim-wordmotion'
Plug 'junegunn/vim-slash'

Plug 'mhinz/vim-startify'

" CoC
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
  " open coc-explorer (plugin)
  nnoremap <silent> <leader>e :CocCommand explorer<CR>

" Initialize plugin system
call plug#end()

" this has to be down here or it doesnt work with vim-plug 🤷‍♂️
colorscheme nord

lua << EOF
  require("which-key").setup() 
EOF

" That's all, folks!
