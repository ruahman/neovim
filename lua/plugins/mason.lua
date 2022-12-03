local export = {}

function export.config()
  require("mason").setup()
  require("mason-lspconfig").setup()
end

return export
