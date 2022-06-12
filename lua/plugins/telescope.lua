local utils = require('utils')
local map = utils.map

-- load faster fuzy finder 
require('telescope').load_extension('fzf')

local builtin = require'telescope.builtin'

-- text
map('n', '<leader>ff', ':lua require"telescope.builtin".find_files()<CR>')
map('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
map('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')

-- lsp
map('n', '<leader>gr', ':lua require"telescope.builtin".lsp_references()<CR>')
map('n', '<leader>gd', ':lua require"telescope.builtin".lsp_definitions()<CR>')
map('n', '<leader>gi', ':lua require"telescope.builtin".lsp_implementations()<CR>')

vim.keymap.set('n', '<leader>di', builtin.diagnostics)
