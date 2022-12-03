-- require("nvim-lsp-installer").setup{}
local export = {}

function export.config()
  local lspconfig = require("lspconfig")

  -- share capabilities of lsp with lsp clients
  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local on_format = function()
    vim.lsp.buf.format({ async = true })
  end

  -- local on_attach = function(client, bufnr)
  local on_attach = function()
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = 0 }) -- hover information
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 }) -- go to definition of function
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 }) -- go to definition of a type
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 }) -- go to implementaion of an interface or method
    vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { buffer = 0 }) -- list diagnostics
    vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, { buffer = 0 }) -- show refrences hight lighted word
    vim.keymap.set("n", "gf", on_format, { buffer = 0 }) -- format
    vim.keymap.set("n", "ge", vim.diagnostic.open_float) -- explain errors
  end

  -- lua
  lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- golang
  lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- rust
  lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- c/cpp
  lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- python
  lspconfig.pylsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- deno
  lspconfig.denols.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- ruby
  lspconfig.solargraph.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- format on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.c",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.cpp",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.lua",
    callback = on_format,
  })
end

return export
