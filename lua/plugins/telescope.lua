local utils = require('utils')
local map = utils.map

map('n', '<leader>ff', ':lua require"telescope.builtin".find_files()<CR>')
map('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
map('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')
map('n', '<leader>fr', ':lua require"telescope.builtin".lsp_references()<CR>')
map('n', '<leader>fd', ':lua require"telescope.builtin".lsp_definitions()<CR>')
map('n', '<leader>fi', ':lua require"telescope.builtin".lsp_implementations()<CR>')
