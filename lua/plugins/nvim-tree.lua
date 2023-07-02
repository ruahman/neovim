local export = {}

function export.config()
  local map = require("utils").map

  require("nvim-tree").setup({
    sync_root_with_cwd = true,
  })

  -- setup keymap
  map("n", "<Leader>e", ":NvimTreeToggle<CR>")
end

return export
