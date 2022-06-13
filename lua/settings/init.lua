-- see :help options

-- local utils = require('utils')

vim.opt.syntax = 'on'
vim.opt.colorcolumn = '80'
vim.opt.wrap = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

-- insert space for tab
vim.opt.tabstop = 2
-- insert space for indent
vim.opt.shiftwidth = 2
-- insert space when in insert
vim.opt.softtabstop = 2
-- expand tabs to space
vim.opt.expandtab = true

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.listchars = { 
  tab = '▸ ', 
  eol = '¬', 
  space = '.', 
  nbsp = '.' 
}

-- no swap file???
vim.cmd[[set nobackup nowritebackup noswapfile]]

-- for python
vim.cmd[[autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4]]
