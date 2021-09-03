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
  set number
  set nowrap

" Leader
let mapleader = " "

" Improve splits
  set splitbelow
  set splitright

" Copy highlighted text to clipboard https://github.com/neovim/neovim/issues/5052#issuecomment-232083842
vnoremap <M-c> "+y

" Forward deletion
inoremap <C-d> <Del>

" Delete buffers that aren't visible
func! Delete_buffers()
    let l:buffers = filter(getbufinfo(), {_, v -> v.hidden})
    if !empty(l:buffers)
        execute 'bwipeout' join(map(l:buffers, {_, v -> v.bufnr}))
    endif
endfunc
nnoremap <silent> <leader><BS> :call Delete_buffers()<CR>:echo "Non-windowed buffers are deleted"<CR>

" Meta
  nnoremap <leader>vv :e ~/Repos/config/vimrc<CR>
  nnoremap <leader>vr :source $MYVIMRC<CR> 
  nnoremap <leader>vp :PlugInstall<CR>

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" FZF (both lines needed)
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  let g:fzf_history_dir = '~/.local/share/fzf-history'
  nmap <Leader>f :Files<CR>
  nmap <Leader>h :History<CR>
  nmap <Leader>b :Buffers<CR>
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
Plug 'thoughtbot/vim-rspec'

" Git
Plug 'tpope/vim-fugitive'
  nnoremap <leader>gg :G<cr>
Plug 'mhinz/vim-signify'
  set updatetime=100
  nnoremap <leader>hd :SignifyDiff<cr>
  nnoremap <leader>hp :SignifyHunkDiff<cr>
  nnoremap <leader>hu :SignifyHunkUndo<cr>
Plug 'rhysd/git-messenger.vim'

" Aesthetics
set termguicolors
Plug 'machakann/vim-highlightedyank'
Plug 'psliwka/vim-smoothie'
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
  \ 'component_function': {
  \   'filename'  : 'FileRelativeToRepo',
  \   'gitbranch' : 'FugitiveHead'
  \ },
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
  " E erb tag
  Plug 'whatyouhide/vim-textobj-erb' 
  " i indent level
  Plug 'michaeljsmith/vim-indent-object'
  " c comment
  Plug 'glts/vim-textobj-comment'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
nnoremap <Leader>e :CocCommand explorer<CR>
Plug 'dense-analysis/ale'

Plug 'chrisbra/Colorizer'

" Initialize plugin system
call plug#end()

" this has to be down here or it doesnt work with vim-plug 🤷‍♂️
colorscheme nord

" That's all, folks!
