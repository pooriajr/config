" Standard Settings
set smartcase
set ignorecase
" set nohlsearch
set incsearch
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
set foldmethod=manual
set foldlevel=99
set number
set noemoji
set relativenumber
set scrolloff=3
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set linebreak
set noswapfile
set nowrap

" Leader
let mapleader = " "

" Leader shorcuts
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" Improve splits
set splitbelow
set splitright

" Copy highlighted text to clipboard with command c https://github.com/neovim/neovim/issues/5052#issuecomment-232083842
vnoremap <M-c> "+y

" Maximize window with Ctrl + W > Enter
nnoremap <C-W><CR> <C-W>_<C-W><Bar>

" Forward deletion
inoremap <C-d> <Del>

" Meta
nnoremap <leader>vv :tabnew ~/Repos/config/vimrc<CR>
nnoremap <leader>vr :source $MYVIMRC<CR> 
nnoremap <leader>vp :PlugInstall<CR>

" Abbreviations
iabbrev bpry require 'pry'; binding.pry;

" No ex mode - instead execute macro in q
map Q @q

" Escape in terminal
map <Leader>> <C-W>s:terminal<CR>a
tnoremap <esc><esc> <C-\><C-N>

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Move on visual lines
nmap k gk
nmap j gj

" FZF (both lines needed)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_history_dir = '~/.local/share/fzf-history'
nmap <Leader>f :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>/ :Rg<Space>
nmap <Leader>? :Helptags!<CR>
nmap <Leader>: :History:<CR>

" File Explorer
Plug 'preservim/nerdtree'
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Formatting
nmap <Leader>= mm=ae`m

" ! to :! (for fast console commands)
nnoremap ! :!

Plug 'tpope/vim-surround'
" some erb conveniences from https://gist.github.com/AndrewRadev/3028833 (the b: makes it only work in erb files)
let b:surround_{char2nr('=')} = "<%= \r %>"
let b:surround_{char2nr('-')} = "<% \r %>"
let b:surround_{char2nr('%')} = "{% \r %}"
let b:surround_{char2nr('i')} = "<% if \1<% if: \1 %> \r <% end %>"
let b:surround_{char2nr('u')} = "<% unless \1<% unless: \1 %> \r <% end %>"
let b:surround_{char2nr('w')} = "<% while \1<% while: \1 do %> \r <% end %>"
let b:surround_{char2nr('e')} = "<% \1<% collection: \1.each do |\2item: \2| %> \r <% end %>"
let b:surround_{char2nr('d')} = "<% do %> \r <% end %>"

Plug 'tpope/vim-commentary'
autocmd FileType yaml setlocal commentstring=#\ %s
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim'
Plug 'LunarWatcher/auto-pairs', {'branch': 'develop'}

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

"Drag lines around in visual mode
vmap J :m '>+1<CR>gv=gv
vmap K :m '<-2<CR>gv=gv

" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-bundler'
nmap <leader>rm :Emodel<CR>
nmap <leader>rc :Econtroller<CR>
nmap <leader>rvi :Eview index<CR>
nmap <leader>rvn :Eview new<CR>
nmap <leader>rve :Eview edit<CR>
nmap <leader>rvs :Eview show<CR>
nmap <leader>rr :Einitializer<CR>
nmap <leader>rt :Rails console<CR>
nmap <leader>rgm :Rails g migration
nmap <leader>rdm :Rails db:migrate
nmap <leader>rdr :Rails db:rollback
nmap <leader>rdb :Rails db<CR>
nmap <leader>R :!ruby %<CR>

Plug 'airblade/vim-localorie' "i18n
nnoremap <silent> <leader>lt :call localorie#translate()<CR>
nnoremap <silent> <leader>le :echo localorie#expand_key()<CR>

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
nnoremap <leader>gg :G<cr>
nnoremap <leader>gw :Git add . \| Git commit -m "WIP" \| Git push<cr>
nnoremap <leader>gs :Git status<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gb :GBrowse<cr>
Plug 'mhinz/vim-signify'
set updatetime=50
nnoremap <leader>gd :SignifyDiff<cr>
nnoremap <leader>ghd :SignifyHunkDiff<cr>
nnoremap <leader>ghu :SignifyHunkUndo<cr>
Plug 'rhysd/git-messenger.vim'

" Deployment
map <leader>D :Dispatch deploy<cr>

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
  return printf(' = %-3d%s', foldedlinecount, line)
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
Plug 'kana/vim-textobj-entire' " e entire file
Plug 'nelstrom/vim-textobj-rubyblock' " r ruby block
Plug 'kana/vim-textobj-function' " f function
Plug 'haya14busa/vim-textobj-function-syntax' " f function
Plug 'whatyouhide/vim-textobj-erb' " E erb tag
Plug 'glts/vim-textobj-comment' " c comment
Plug 'kana/vim-textobj-line' " l line
" smarter text objects
Plug 'wellle/targets.vim'
Plug 'chaoren/vim-wordmotion'

" testing
Plug 'vim-test/vim-test'
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" misc
Plug 'pangloss/vim-javascript'
Plug 'bronson/vim-visual-star-search'
Plug 'AndrewRadev/qftools.vim'
Plug 'AndrewRadev/switch.vim'
let g:switch_mapping = "-"
Plug 'AndrewRadev/undoquit.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/vim-peekaboo'
nnoremap <C-/> :nohl<CR>
map <leader>o :only<cr>

Plug 'github/copilot.vim'
map <leader>cp :Copilot panel<cr>
let g:copilot_filetypes = {
      \ '*': v:true,
      \ }

Plug 'pooriar/codi.vim'
map <leader>co :Codi<cr>

Plug 'mbbill/undotree'

Plug 'nvim-lua/plenary.nvim'
Plug 'ThePrimeagen/harpoon'
nnoremap <leader>m :lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>h :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap U :UndotreeToggle<CR>
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

" Keep page centered when searching around
nmap n nzzzv
nmap N Nzzzv

" Copy to clipboard
nmap <leader>y "+y
nmap <leader>Y "+yy
vmap <leader>y "+y
" Paste from clipboard
nmap <leader>p "+p
vmap <leader>p "+p

" Initialize plugin system
call plug#end()

" this has to be down here or it doesnt work with vim-plug 🤷‍♂️
colorscheme nord

nnoremap <Leader>c :call ConcealCSSClasses()<cr>
function! ConcealCSSClasses() abort
  let id = get(w:, 'concealed_id', 0)
  if id
    call matchdelete(id)
    unlet w:concealed_id
    set conceallevel=0
  else
    let w:concealed_id =
          \ matchadd('conceal', "\\v%(class\\s*[:,=]\\s*)@<=([\x22\x27]).{-}\\1",
          \ 777, -1, #{conceal: '…'})
    set conceallevel=2
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-n>"
  endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-p>

" That's all, folks!
