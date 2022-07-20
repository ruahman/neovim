
-- load faster fuzy finder 
require('telescope').load_extension('fzf')

local builtin = require'telescope.builtin'

-- text
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>fb', builtin.buffers)

-- lsp
vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions)
vim.keymap.set('n', '<leader>gr', builtin.lsp_references)
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations)
vim.keymap.set('n', '<leader>ge', builtin.diagnostics)
