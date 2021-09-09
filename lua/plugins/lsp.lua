local lspconfig = require('lspconfig')
local completion = require('completion')

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

-- key mappings
local utils = require('utils')
utils.key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
utils.key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
utils.key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
utils.key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
utils.key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
utils.key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
utils.key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
utils.key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
utils.key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
utils.key_mapper('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
utils.key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')

-- auto-format
vim.api.nvim_command('autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.api.nvim_command('autocmd FileType ruby setlocal ts=2 sts=2')
vim.api.nvim_command('autocmd BufWritePre *.rb lua vim.lsp.buf.formatting_sync(nil, 100)')
