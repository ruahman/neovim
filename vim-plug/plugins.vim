" auto install vim-plug if not setup
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" my plugins
call plug#begin('~/.config/nvim/autoload/plugged')

	" Better Syntax Support
	Plug 'sheerun/vim-polyglot'

	" File Explorer
	Plug 'scrooloose/NERDTree'

	" Auto pairs for '(' '[' '{'
	Plug 'jiangmiao/auto-pairs'

	" themes for vim
	Plug 'joshdick/onedark.vim'
	Plug 'arcticicestudio/nord-vim'

	" vim lightline status bar
	Plug 'itchyny/lightline.vim'

  " vim-sneak for navigating
	Plug 'justinmk/vim-sneak'

  " quick scope for f
	Plug 'unblevable/quick-scope'

  " easymotion
	Plug 'haya14busa/vim-easymotion'

	" comentary
	Plug 'tpope/vim-commentary'

  " surround
	Plug 'tpope/vim-surround'

call plug#end()
