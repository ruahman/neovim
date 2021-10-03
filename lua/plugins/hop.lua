require'hop'.setup()

local utils = require'utils'
local map = utils.set_keymap

map('n','<Leader>w',"<cmd>lua require'hop'.hint_words()<cr>")
map('n','<Leader>s',"<cmd>lua require'hop'.hint_char2()<cr>")
map('n','<Leader>S',"<cmd>lua require'hop'.hint_char1()<cr>")
