syntax on     		      " enable syntax highlighting

set colorcolumn=80        " show pep8 border

set nowrap                " Display long lines as just one line

set autoindent	          " automatic indentation in vim	

set tabstop=4			  " set number of spaces in tab
set expandtab			  " replace tabs with white spaces
set softtabstop=4 		  " when you backspace it will remove the same amount of spaces you set for tabs
set smarttab              " Makes tabbing smarter will realize you have 2 vs 4
set smartindent           " Makes indenting smart
set autoindent            " Good auto indent

set number    			  " set line numbers
set cursorline            " highlight current line
set relativenumber        " show relative numbers 

set updatetime=300
set timeoutlen=500

set encoding=utf-8        " The encoding displayed
set fileencoding=utf-8    " The encoding written to file

set listchars=tab:▸\ ,eol:¬,trail:~,nbsp:.,space:.

set splitbelow            " Horizontal splits will automatically be below
set splitright            " Vertical splits will automatically be to the right

" fuzzy file search
set path+=**              " enable fuzzy search
set wildmenu              " menu for results

" setup left explorer size (Lex)
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_liststyle = 3

" setup tabing setting for ruby
autocmd FileType ruby setlocal ts=2 sts=2

" auto-format
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
