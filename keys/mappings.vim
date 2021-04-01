" think of leader key as a brand new namespace for keybindings
let mapleader = "\<Space>"

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" buffers
nnoremap bn :bn<CR>
nnoremap bd :bd<CR>

" toogle left explorer (Lex)
nmap <Leader>L :Lex<CR>

" resize windows
nnoremap <M-h>    :vertical resize +2<CR>
nnoremap <M-l>    :vertical resize -2<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" show spaces, tabs and endlines
nnoremap <leader>l :set list!<CR>

" toogle :hls
:nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

command! Refresh source $MYVIMRC

" make ctags
command! MakeTags !ctags -R .
