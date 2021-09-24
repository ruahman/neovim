local lspconfig = require('lspconfig')
local completion = require('completion')

-- python
lspconfig.pylsp.setup{
  on_attach = completion.on_attach;
  filetypes = {"python"},
  root_dir = lspconfig.util.root_pattern(".git","."),
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
  on_attach = completion.on_attach;
  filetypes = {"ruby", "rakefile"},
  root_dir = lspconfig.util.root_pattern("Gemfile",".git","."),
  settings = {
    solargraph = {
      autoformat=true;
      completion=true;
      diagnostics=true;
    }
  }
}

-- go
require'lspconfig'.gopls.setup{
  on_attach = completion.on_attach;
  filetypes = { "go", "gomod" },
  root_dir = lspconfig.util.root_pattern("go.mod", ".git",".")
}

-- ocaml
require'lspconfig'.ocamllsp.setup{
  on_attach = completion.on_attach;
  filetypes = { 
    "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason" },
  root_dir = lspconfig.util.root_pattern(
    "*.opam", "esy.json", "package.json", ".git", ".")
}

-- haskell
require'lspconfig'.hls.setup{
  on_attach = completion.on_attach;
  filetypes = { "haskell", "lhaskell" },
  root_dir = lspconfig.util.root_pattern(
    "*.cabal", "stack.yaml", "cabal.project", "package.yaml", "hie.yaml", ".")
}

-- rust
require'lspconfig'.rls.setup{
  on_attach = completion.on_attach;
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern("Cargo.toml", ".")
}



-- key mappings
local utils = require('utils')
utils.key_mapper('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
utils.key_mapper('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
utils.key_mapper('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
utils.key_mapper('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
utils.key_mapper('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
utils.key_mapper('n', '<C-p>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
utils.key_mapper('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
utils.key_mapper('n', '<leader>F', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 100)<CR>')

-- auto-format
vim.cmd[[autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)]]
vim.cmd[[autocmd FileType ruby setlocal ts=2 sts=2]]
vim.cmd[[autocmd FileType go set ts=2 sts=2 shiftwidth=2 expandtab]]
vim.cmd[[autocmd BufWritePre *.rb lua vim.lsp.buf.formatting_sync(nil, 100)]]
