local utils = require('utils')
local global = utils.global
local map = utils.map

require'nvim-tree'.setup{}

map('n', '<Leader>e', ':NvimTreeToggle<CR>')

global.nvim_tree_quit_on_open = 1
