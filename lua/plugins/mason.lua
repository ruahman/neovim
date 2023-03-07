local export = {}

function export.config()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "gopls",
      "clangd"
    },
  })
end

return export
