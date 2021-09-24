local utils = require('utils')

utils.opt('o','syntax','on')

utils.opt('w','colorcolumn','80')

utils.opt('o','wrap', false)

utils.opt('o','splitbelow', true)
utils.opt('o','splitright', true)

utils.opt('o','number',true)
utils.opt('o','cursorline',true)
utils.opt('o','relativenumber',true)

utils.opt('opt', 'tabstop', 4)
utils.opt('opt', 'expandtab', true)
utils.opt('opt', 'softtabstop', 4)
utils.opt('opt', 'smarttab', true)
utils.opt('opt', 'smartindent', true)
utils.opt('opt', 'autoindent', true)

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


