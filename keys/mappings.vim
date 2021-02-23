
" think of leader key as a brand new namespace for keybindings
let mapleader = "\<Space>"

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" tabs
nnoremap <tab> :tabn<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew<CR>

" buffers
nnoremap bn :bn<CR>
nnoremap bd :bd<CR>

" toogle NERDTree
nmap nt :NERDTreeToggle<CR>

" resize windows
nnoremap <M-h>    :vertical resize +2<CR>
nnoremap <M-l>    :vertical resize -2<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

command! Refresh source $MYVIMRC

nnoremap sl :set list!<CR>

" toogle :hls
:nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
