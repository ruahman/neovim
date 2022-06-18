local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- set leader key
vim.g.mapleader = ' '

keymap('n', '<Leader>h', ':set hlsearch!<CR>', opts)
keymap('n', '<Leader>l', ':set list!<CR>', opts)

keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'kj', '<ESC>', opts)

keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- keymap('n', '<M-h>', ':vertical resize +2<CR>', opts)
-- keymap('n', '<M-l>', ':vertical resize -2<CR>', opts)
-- utils.map('n', '<M-j>', ':resize -2<CR>')
-- utils.map('n', '<M-k>', ':resize +2<CR>')

-- move line
keymap('n', '<M-j>', ':m .+1<cr>==', opts)
keymap('n', '<M-k>', ':m .-2<CR>==', opts)
keymap('v', '<M-j>', ":m '>+1<cr>gv=gv", opts)
keymap('v', '<M-k>', ":m '<-2<cr>gv=gv", opts)
