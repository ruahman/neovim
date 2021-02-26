" auto install vim-plug if not setup

" if plug.vim not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	" download vim-plug
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" my plugins, this directory they go into
call plug#begin('~/.config/nvim/autoload/plugged')

	" Better Syntax Support
	Plug 'sheerun/vim-polyglot'

	" File Explorer
	Plug 'scrooloose/NERDTree'

	" Auto pairs for '(' '[' '{'
	Plug 'jiangmiao/auto-pairs'

	" themes for vim
	Plug 'joshdick/onedark.vim'
  Plug 'tomasr/molokai'
	Plug 'tyrannicaltoucan/vim-deep-space'

	" vim lightline status bar
	Plug 'itchyny/lightline.vim'

  " vim-sneak 
	Plug 'justinmk/vim-sneak'

  " quick scope 
	Plug 'unblevable/quick-scope'

  " easymotion
	Plug 'haya14busa/vim-easymotion'

	" comentary
	Plug 'tpope/vim-commentary'

  " surround
	Plug 'tpope/vim-surround'

	" coc code complete
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
