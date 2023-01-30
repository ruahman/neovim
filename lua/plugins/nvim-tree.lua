local export = {}

function export.config()
  local map = require('utils').map

  -- disable netrw at the very start of your init.lua (strongly advised)
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- empty setup using defaults
  require'nvim-tree'.setup{
    auto_reload_on_write = true,
    sync_root_with_cwd = true,
    on_attach = function(bufnr)
      local bufmap = function(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
      end

      -- See :help nvim-tree.api
      local api = require('nvim-tree.api')

      bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
    end
  }

  -- setup keymap
  map('n', '<Leader>e', ':NvimTreeToggle<CR>')
end

return export
