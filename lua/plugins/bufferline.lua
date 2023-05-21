
local M = {}

function M.config()
  local map = require('utils').map

  require('bufferline').setup {
    options = {
      -- close_command = "Bdelete! %d",
      offsets = {
        {
          filetype = "NvimTree",
          text = "nvim-tree",
          highlight = "Directory",
          text_align = "left"
        }
      },
      diagnostics = "nvim_lsp",
    }
  }

  map('n','<S-l>',':BufferLineCycleNext<CR>')

  map('n', '<S-h>',':BufferLineCyclePrev<CR>')

  map('n', 'bd',':Bdelete<CR>')
end

return M
