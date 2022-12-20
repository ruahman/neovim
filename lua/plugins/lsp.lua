local M = {}

-- M.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- function M.on_attach()
--   vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = 0 }) -- hover information
--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 }) -- go to definition of function
--   vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 }) -- go to definition of a type
--   vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 }) -- go to implementaion of an interface or method
--   vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { buffer = 0 }) -- list diagnostics
--   vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, { buffer = 0 }) -- show refrences hight lighted word
--   -- vim.keymap.set('n', '<leader>gd', require("telescope.builtin").lsp_definitions)
--   vim.keymap.set("n", "gf", vim.lsp.buf.format, { buffer = 0 }) -- format
--   -- vim.keymap.set('n', '<leader>fi', require("telescope.builtin").lsp_implementations, { buffer = 0 })
--   vim.keymap.set("n", "ge", vim.diagnostic.open_float, { buffer = 0 }) -- explain errors
-- end

function M.config()
  local lspconfig = require("lspconfig")

  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local on_format = function()
    vim.lsp.buf.format({ async = true })
  end

  local on_attach = function()
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = 0 }) -- hover information
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 }) -- go to definition of function
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 }) -- go to definition of a type
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 }) -- go to implementaion of an interface or method
    vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { buffer = 0 }) -- list diagnostics
    vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, { buffer = 0 }) -- show refrences hight lighted word
    -- vim.keymap.set('n', '<leader>gd', require("telescope.builtin").lsp_definitions)
    vim.keymap.set("n", "gf", on_format, { buffer = 0 }) -- format
    -- vim.keymap.set('n', '<leader>fi', require("telescope.builtin").lsp_implementations, { buffer = 0 })
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, { buffer = 0 }) -- explain errors
  end

  -- lua
  lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "s", "fmt", "i" },
        },
      },
    },
  })

  -- dart
  lspconfig.dartls.setup({
    on_attach = on_attach,
    capabilities = capabilities
  })

  -- golang
  lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("go.mod"),
  })

  -- rust
  lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("Cargo.toml"),
  })

  -- c/cpp
  lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("*.c", "*.cpp"),
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
    root_dir = lspconfig.util.root_pattern("deno.json"),
  })

  -- dotnet
  lspconfig.omnisharp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("*.csproj"),
  })

  -- format on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = on_format,
  })

  -- vim.api.nvim_create_autocmd("BufWritePre", {
  --   pattern = "*.rs",
  --   callback = on_format,
  -- })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.ts",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.js",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.cs",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.dart",
    callback = on_format,
  })
end

return M
