local lspconfig = require('lspconfig')
local utils = require('utils')

-- vim.lsp.set_log_level("debug")

local capabilities = require('cmp_nvim_lsp').update_capabilities(
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

-- ruby
lspconfig.solargraph.setup{
  capabilities,
  root_dir = lspconfig.util.root_pattern("Gemfile",".git","*.rb"),
  settings = {
    solargraph = {
      autoformat=true;
      completion=true;
      diagnostics=true;
    }
  }
}

-- golang
lspconfig.gopls.setup{
  capabilities
}

-- rust
lspconfig.rust_analyzer.setup{
  capabilities
}

-- ocaml
lspconfig.ocamllsp.setup{
  capabilities,
  root_dir = lspconfig.util.root_pattern(
    "*.opam", "esy.json", "package.json", ".git", "*.ml")
}

-- haskell
require'lspconfig'.hls.setup{
  capabilities,
  root_dir = lspconfig.util.root_pattern(
    "*.cabal", 
    "stack.yaml", 
    "cabal.project", 
    "package.yaml", 
    "hie.yaml", 
    "*.hs")
}

-- key mappings
local map = utils.map
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<leader>F', '<cmd>lua vim.lsp.buf.formatting()<CR>')

-- auto-format
local cmd = utils.cmd
cmd[[autocmd BufWritePre *.py lua vim.lsp.buf.formatting()]]
cmd[[autocmd BufWritePre *.go lua vim.lsp.buf.formatting()]]
cmd[[autocmd BufWritePre *.rs lua vim.lsp.buf.formatting()]]
cmd[[autocmd BufWritePre *.rb lua vim.lsp.buf.formatting()]]
