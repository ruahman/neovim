local utils = require('utils')
local global = utils.global

-- set leader key
global.mapleader = ' '

utils.set_keymap('n', '<Leader>e', ':Lex<CR>')

utils.set_keymap('n', '<Leader>h', ':set hlsearch!<CR>')
utils.set_keymap('n', '<Leader>l', ':set list!<CR>')

utils.set_keymap('i', 'jk', '<ESC>')
utils.set_keymap('i', 'kj', '<ESC>')

utils.set_keymap('v', '<', '<gv')
utils.set_keymap('v', '>', '>gv')

utils.set_keymap('n', '<M-h>', ':vertical resize +2<CR>')
utils.set_keymap('n', '<M-l>', ':vertical resize -2<CR>')
utils.set_keymap('n', '<M-j>', ':resize -2<CR>')
utils.set_keymap('n', '<M-k>', ':resize +2<CR>')
