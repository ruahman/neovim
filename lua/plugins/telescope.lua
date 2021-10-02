local utils = require('utils')

utils.set_keymap('n', '<leader>ff', ':lua require"telescope.builtin".find_files()<CR>')
utils.set_keymap('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
utils.set_keymap('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')
-- utils.set_keymap('n', '<leader>fe', ':lua require"telescope.builtin".file_browser()<CR>')
