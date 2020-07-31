inoremap jk <Esc>
noremap ; :
syntax on

" Dark grey line numbers
set number
highlight LineNr ctermfg=darkgrey

" Treat all .md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Set autoformatting of paragraphs
autocmd Filetype markdown setlocal formatoptions=aw2tq
