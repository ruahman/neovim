
-- load faster fuzy finder 
require('telescope').load_extension('fzf')

local builtin = require'telescope.builtin'

-- text
vim.keymap.set('n', '<leader>ff', require"telescope.builtin".find_files)
vim.keymap.set('n', '<leader>fs', require"telescope.builtin".live_grep)
vim.keymap.set('n', '<leader>fb', require"telescope.builtin".buffers)

-- lsp
vim.keymap.set('n', '<leader>gr', require"telescope.builtin".lsp_references)
vim.keymap.set('n', '<leader>gd', require"telescope.builtin".lsp_definitions)
vim.keymap.set('n', '<leader>gi', require"telescope.builtin".lsp_implementations)

vim.keymap.set('n', '<leader>di', builtin.diagnostics)
