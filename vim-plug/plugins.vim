
" if plug.vim not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	" download vim-plug
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" my plugins, this directory they go into
call plug#begin('~/.config/nvim/autoload/plugged')

	" Better Syntax Support
	Plug 'sheerun/vim-polyglot'

	" Auto pairs for '(' '[' '{'
	Plug 'jiangmiao/auto-pairs'

	" themes for vim
	Plug 'tomasr/molokai'

	" vim lightline status bar
	Plug 'itchyny/lightline.vim'

	" vim-cool, disable search highlighting when you are done and re-enable
	" when you search again
	Plug 'romainl/vim-cool'

	" vim-closer, closings are automatically inserted after pressing enter
	Plug 'rstacruz/vim-closer'

    " easymotion
	Plug 'haya14busa/vim-easymotion'

	" comentary
	Plug 'tpope/vim-commentary'

    " surround
	Plug 'tpope/vim-surround'

	" setup language server
	Plug 'neovim/nvim-lspconfig'

	" auto complete
	Plug 'nvim-lua/completion-nvim'

	" ultisnips
	Plug 'SirVer/ultisnips'

call plug#end()
