local export = {}

function export.config()
  require("toggleterm").setup{
    open_mapping = [[<c-\>]],
    direction = 'float'
  }
end

return export
