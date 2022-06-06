local utils = require('utils')

-- set leader key
vim.g.mapleader = ' '

utils.map('n', '<Leader>h', ':set hlsearch!<CR>')
utils.map('n', '<Leader>l', ':set list!<CR>')

utils.map('i', 'jk', '<ESC>')
utils.map('i', 'kj', '<ESC>')

utils.map('v', '<', '<gv')
utils.map('v', '>', '>gv')

utils.map('n', '<M-h>', ':vertical resize +2<CR>')
utils.map('n', '<M-l>', ':vertical resize -2<CR>')
utils.map('n', '<M-j>', ':resize -2<CR>')
utils.map('n', '<M-k>', ':resize +2<CR>')

-- move line
utils.map('n', '<A-j>', ':m .+1<cr>==')
utils.map('n', '<A-k>', ':m .-2<CR>==')
utils.map('v', '<A-j>', ":m '>+1<cr>gv=gv")
utils.map('v', '<A-k>', ":m '<-2<cr>gv=gv")
