require'nvim-tree'.setup{}

local utils = require('utils')

utils.map('n', '<Leader>e', ':NvimTreeToggle<CR>')

vim.g.nvim_tree_quit_on_open = 1
