" think of leader key as a brand new namespace for keybindings
let mapleader = "\<Space>"

" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>

" buffers
nnoremap bn :bn<CR>
nnoremap bp :bp<CR>
nnoremap bd :bd!<CR>

" resize windows
nnoremap <M-h>    :vertical resize +2<CR>
nnoremap <M-l>    :vertical resize -2<CR>

" Better tabbing, reselect visual
vnoremap < <gv
vnoremap > >gv

" show spaces, tabs and endlines
nnoremap <silent> <leader>l :set list!<CR>

" toogle :hls
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

command! Refresh source $MYVIMRC

" set current file as current directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" config language server custom key maps
" source $HOME/.config/nvim/keys/lsp-config.vim
