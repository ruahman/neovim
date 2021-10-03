local utils = require('utils')
local global = utils.global

require'nvim-tree'.setup{}

utils.set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>')

global.nvim_tree_quit_on_open = 1
