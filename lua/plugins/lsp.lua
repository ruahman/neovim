require("nvim-lsp-installer").setup{}

local lspconfig = require('lspconfig')

-- share capabilities of lsp with lsp clients
local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
  )

-- python
lspconfig.pylsp.setup{
  capabilities,
  root_dir = lspconfig.util.root_pattern("*.toml","*.lock",".git","*.py"),
  settings = {
    pylsp = {
      enable = true;
      configurationSources = { "flake8" };
      plugins = {
        pycodestyle = { enabled = false; };
        flake8 = { enabled = true; };
        pyflakes = { enabled = false; };
        pydocstyle = { enabled = true; };
        yapf = { enabled = true; };
      }
    }
  }
}

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
  root_dir = lspconfig.util.root_pattern("*.go","go.mod"),
}


-- rust
local on_attach = function(client)
    require'completion'.on_attach(client)
end

lspconfig.rust_analyzer.setup{
  capabilities,
  on_attach,
  settings = {
      ["rust-analyzer"] = {
          assist = {
              importGranularity = "module",
              importPrefix = "self",
          },
          cargo = {
              loadOutDirsFromCheck = true
          },
          procMacro = {
              enable = true
          },
      }
  },
  root_dir = lspconfig.util.root_pattern("Cargo.toml","*.rs"),
}

-- c,c++
lspconfig.clangd.setup{
  capabilities,
  root_dir = lspconfig.util.root_pattern("*.c","*.cpp"),
}

-- lua
lspconfig.sumneko_lua.setup{}

-- key mappings
vim.keymap.set("n", "gh", vim.lsp.buf.hover) -- hover information
vim.keymap.set("n", "gd", vim.lsp.buf.definition) -- like definition of function
-- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition) -- like definition of a type
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation) -- like implementaion of interface
-- vim.keymap.set("n", "gr", vim.lsp.buf.references) -- references
-- vim.keymap.set("n", "gf", vim.lsp.buf.formatting) -- formatting

-- format
local on_format = function(client)
  vim.lsp.buf.format{async=true}
end
vim.keymap.set("n", "gf", on_format)

vim.keymap.set('n', 'ge', vim.diagnostic.open_float) -- explain

-- auto-format
-- vim.cmd[[autocmd BufWritePre *.py lua vim.lsp.buf.formatting()]]
-- vim.cmd[[autocmd BufWritePre *.go lua vim.lsp.buf.formatting()]]
vim.api.nvim_create_autocmd("BufWritePre",{
  pattern = "*.rs",
  callback = on_format,
})
-- vim.cmd[[autocmd BufWritePre *.rs lua vim.lsp.buf.format()]]
-- -- cmd[[autocmd BufWritePre *.rb lua vim.lsp.buf.formatting()]]
