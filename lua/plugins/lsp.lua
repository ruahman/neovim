local lspconfig = require('lspconfig')

-- vim.lsp.set_log_level("debug")

-- tells lsp what client is capable of doing
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
  )

lspconfig.ccls.setup{
  capabilities,
  root_dir = lspconfig.util.root_pattern(".git","*.c"),
}
-- -- python
-- lspconfig.pylsp.setup{
--   capabilities,
--   root_dir = lspconfig.util.root_pattern("*.toml","*.lock",".git","*.py"),
--   settings = {
--     pylsp = {
--       enable = true;
--       configurationSources = { "flake8" };
--       plugins = {
--         pycodestyle = { enabled = false; };
--         flake8 = { enabled = true; };
--         pyflakes = { enabled = false; };
--         pydocstyle = { enabled = true; };
--         yapf = { enabled = true; };
--       }
--     }
--   }
-- }

-- -- ruby
-- lspconfig.solargraph.setup{
--   capabilities,
--   root_dir = lspconfig.util.root_pattern("Gemfile",".git","*.rb"),
--   settings = {
--     solargraph = {
--       autoformat=true;
--       completion=true;
--       diagnostics=true;
--     }
--   }
-- }

-- golang
lspconfig.gopls.setup{
  capabilities,
  root_dir = lspconfig.util.root_pattern(".git","*.go","go.mod"),
}

-- -- rust
-- lspconfig.rust_analyzer.setup{
--   capabilities,
--   root_dir = lspconfig.util.root_pattern("Cargo.toml","*.rs"),
-- }

-- key mappings
-- utils.map('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set("n", "gh", vim.lsp.buf.hover) -- hover information
-- utils.map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set("n", "gd", vim.lsp.buf.definition) -- like definition of function
-- utils.map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition) -- like definition of a type
-- utils.map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set("n", "gi", vim.lsp.buf.implementation) -- like implementaion of interface
-- utils.map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set("n", "gr", vim.lsp.buf.references)
-- utils.map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set("n", "gf", vim.lsp.buf.formatting)

-- auto-format
-- cmd[[autocmd BufWritePre *.py lua vim.lsp.buf.formatting()]]
vim.cmd[[autocmd BufWritePre *.go lua vim.lsp.buf.formatting()]]
-- cmd[[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting()]]
-- cmd[[autocmd BufWritePre *.rb lua vim.lsp.buf.formatting()]]
