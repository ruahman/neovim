local utils = require('utils')
local global = utils.global
local map = utils.map

-- set leader key
global.mapleader = ' '

map('n', '<Leader>h', ':set hlsearch!<CR>')
map('n', '<Leader>l', ':set list!<CR>')

map('i', 'jk', '<ESC>')
map('i', 'kj', '<ESC>')

map('v', '<', '<gv')
map('v', '>', '>gv')

map('n', '<M-h>', ':vertical resize +2<CR>')
map('n', '<M-l>', ':vertical resize -2<CR>')
map('n', '<M-j>', ':resize -2<CR>')
map('n', '<M-k>', ':resize +2<CR>')
