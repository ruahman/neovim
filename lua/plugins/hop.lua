require'hop'.setup()

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap('n','<Leader>w',"<cmd>lua require'hop'.hint_words()<cr>", opts)
keymap('n','<Leader>f',"<cmd>lua require'hop'.hint_char1()<cr>", opts)
keymap('n','s',"<cmd>lua require'hop'.hint_char2()<cr>", opts)
