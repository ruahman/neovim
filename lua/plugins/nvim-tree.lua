local export = {}

function export.config()
  -- disable netrw at the very start of your init.lua (strongly advised)
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- set termguicolors to enable highlight groups
  vim.opt.termguicolors = true

  -- empty setup using defaults
  require'nvim-tree'.setup{}

  -- setup keymap
  local keymap = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }
  keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', opts)

  vim.g.nvim_tree_quit_on_open = 1
end

return export
