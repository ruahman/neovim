local map = require('utils').map

-- set leader key
vim.g.mapleader = ' '

map('n', '<Leader>h', ':set hlsearch!<CR>')
map('n', '<Leader>l', ':set list!<CR>')

map('v', '<', '<gv')
map('v', '>', '>gv')

map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- keymap('n', '<M-h>', ':vertical resize +2<CR>', opts)
-- keymap('n', '<M-l>', ':vertical resize -2<CR>', opts)
-- utils.map('n', '<M-j>', ':resize -2<CR>')
-- utils.map('n', '<M-k>', ':resize +2<CR>')

-- move line
map('n', '<M-j>', ':m .+1<cr>==')
map('n', '<M-k>', ':m .-2<CR>==')
map('v', '<M-j>', ":m '>+1<cr>gv=gv")
map('v', '<M-k>', ":m '<-2<cr>gv=gv")

-- cd
map('n', 'cd', ':cd %:p:h<CR>')
