
local export = {}

function export.config()

  -- load faster fuzy finder 
  require('telescope').load_extension('fzf')

  local builtin = require'telescope.builtin'

  -- text
  vim.keymap.set('n', '<leader>ff', builtin.find_files) -- list files
  vim.keymap.set('n', '<leader>fb', builtin.buffers) -- list buffers
  vim.keymap.set('n', '<leader>fs', builtin.current_buffer_fuzzy_find) -- search in buffer 
  vim.keymap.set('n', '<leader>fg', builtin.live_grep) -- grep in dir

  -- lsp
  -- vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions)
  -- vim.keymap.set('n', '<leader>gr', builtin.lsp_references)
  -- vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations)
  -- vim.keymap.set('n', '<leader>ge', builtin.diagnostics)
end

return export
