require'nvim-tree'.setup{}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)

vim.g.nvim_tree_quit_on_open = 1
