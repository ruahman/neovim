
let g:ale_linters = {
  \ 'python': ['pylint'], 
  \}

let g:ale_fixers = {
  \ 'python': ['yapf'],
  \}

map <F10> :ALEFix<CR>

let g:ale_fix_on_save = 1
