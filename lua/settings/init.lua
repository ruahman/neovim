local utils = require('utils')

utils.opt('o','syntax','on')

utils.opt('w','colorcolumn','80')

utils.opt('o','wrap', false)

utils.opt('o','splitbelow', true)
utils.opt('o','splitright', true)

utils.opt('o','number',true)
utils.opt('o','cursorline',true)
utils.opt('o','relativenumber',true)

utils.opt('b', 'tabstop', 4)
utils.opt('b', 'expandtab', true)
utils.opt('b', 'softtabstop', 4)
utils.opt('o', 'smarttab', true)
utils.opt('o', 'smartindent', true)
utils.opt('o', 'autoindent', true)

utils.opt('o', 'encoding', 'utf-8')
utils.opt('o', 'fileencoding', 'utf-8')

utils.opt('opt', 'listchars', { 
  tab = '▸ ', 
  eol = '¬', 
  space = '.', 
  nbsp = '.' 
})

utils.opt('g', 'netrw_winsize', 25)
utils.opt('g', 'netrw_liststyle', 3)


