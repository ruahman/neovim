local utils = require('utils')

utils.key_mapper('n', '<leader>ff', ':lua require"telescope.builtin".find_files()<CR>')
utils.key_mapper('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
utils.key_mapper('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
utils.key_mapper('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')
