local export = {}

function export.config()
  require'hop'.setup()

  local keymap = vim.api.nvim_set_keymap
  local opts = { noremap = true, silent = true }

  keymap('n','<Leader>s',"<cmd>lua require'hop'.hint_char2()<cr>", opts)
  keymap('n','<Leader>w',"<cmd>lua require'hop'.hint_words()<cr>", opts)
end

return export
