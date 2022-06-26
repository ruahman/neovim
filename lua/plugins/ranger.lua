vim.cmd [[
let g:rnvimr_enable_ex = 1
let g:rnvimr_enable_picker = 1
]]

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n','<Leader>r',":RnvimrToggle<CR>", opts)
