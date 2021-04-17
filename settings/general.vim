syntax on     				    " enable syntax highlighting

set colorcolumn=80        " show pep8 border

set mouse=a               " Enable your mouse

set nowrap    				    " Display long lines as just one line

set tabstop=2			  	    " set number of spaces in tab

set autoindent				    " automatic indentation in vim	

set expandtab					    " replace tabs with white spaces
set softtabstop=2 		    " when you backspace it will remove the same amount of spaces you set for tabs
set smarttab              " Makes tabbing smarter will realize you have 2 vs 4
set smartindent           " Makes indenting smart
set autoindent            " Good auto indent

set number    				    " set line numbers
set cursorline            " highlight current line
set relativenumber        " show relative numbers 

set encoding=utf-8        " The encoding displayed
set fileencoding=utf-8    " The encoding written to file

set listchars=tab:▸\ ,eol:¬,trail:.,nbsp:.,space:.    

set splitbelow            " Horizontal splits will automatically be below
set splitright            " Vertical splits will automatically be to the right

" fuzzy file search
set path+=**              " enable fuzzy search
set wildmenu              " menu for results

set paste                 " make sure past from clipboard isnt messed up

" setup left explorer size (Lex)
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_liststyle = 3
