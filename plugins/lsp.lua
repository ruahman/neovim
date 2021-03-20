require'lspconfig'.pyright.setup{}

require'lspconfig'.solargraph.setup{
  settings = {
    solargraph = {
      autoformat=false;
      completion=true;
      diagnostics=false;
    }
  }
}

require'lspconfig'.tsserver.setup{}

require'lspconfig'.dockerls.setup{}
