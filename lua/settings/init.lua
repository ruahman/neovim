local utils = require('utils')
local set = utils.set
local global = utils.global
local cmd = utils.cmd

set.syntax = 'on'
set.colorcolumn = '80'
set.wrap = false

set.splitbelow = true
set.splitright = true

set.number = true
set.cursorline = true
set.relativenumber = true

-- insert space for tab
set.tabstop = 2
-- insert space for indent
set.shiftwidth = 2
-- insert space when in insert
set.softtabstop = 2
-- expand tabs to space
set.expandtab = true

set.encoding = 'utf-8'
set.fileencoding = 'utf-8'

set.listchars = { 
  tab = '▸ ', 
  eol = '¬', 
  space = '.', 
  nbsp = '.' 
}

-- global.netrw_banner = 0
-- -- global.netrw_browse_split = 4
-- -- global.netrw_altv = 1
-- global.netrw_winsize = 25
-- global.netrw_liststyle = 3

cmd[[autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4]]
