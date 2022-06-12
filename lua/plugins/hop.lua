require'hop'.setup()

local utils = require'utils'
local map = utils.map

map('n','<Leader>w',"<cmd>lua require'hop'.hint_words()<cr>")
map('n','<Leader>f',"<cmd>lua require'hop'.hint_char1()<cr>")
map('n','s',"<cmd>lua require'hop'.hint_char2()<cr>")
