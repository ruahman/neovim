local utils = require('utils')

utils.opt('g', 'mapleader', ' ')

utils.key_mapper('n', '<Leader>e', ':Lex<CR>')
utils.key_mapper('n', '<Leader>E', ':Explore<CR>')

utils.key_mapper('n', '<Leader>h', ':set hlsearch!<CR>')
utils.key_mapper('n', '<Leader>l', ':set list!<CR>')

utils.key_mapper('i', 'jk', '<ESC>')
utils.key_mapper('i', 'kj', '<ESC>')

utils.key_mapper('n', 'bn', ':bn<CR>')
utils.key_mapper('n', 'bp', ':bp<CR>')

utils.key_mapper('v', '<', '<gv')
utils.key_mapper('v', '>', '>gv')

utils.key_mapper('n', '<M-h>', ':vertical resize +2<CR>')
utils.key_mapper('n', '<M-l>', ':vertical resize -2<CR>')
utils.key_mapper('n', '<M-j>', ':resize -2<CR>')
utils.key_mapper('n', '<M-k>', ':resize +2<CR>')
