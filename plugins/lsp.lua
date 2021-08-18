-- python
require'lspconfig'.pyls.setup{
  on_attach=require'completion'.on_attach;
  settings = {
    pyls = {
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
require'lspconfig'.solargraph.setup{
  on_attach = require'completion'.on_attach;
  settings = {
    solargraph = {
      autoformat=true;
      completion=true;
      diagnostics=true;
    }
  }
}

-- docker
require'lspconfig'.dockerls.setup{
  on_attach=require'completion'.on_attach
}
