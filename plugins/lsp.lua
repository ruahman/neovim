-- python
require'lspconfig'.pyls.setup{
  on_attach=require'completion'.on_attach
}

-- ruby
require'lspconfig'.solargraph.setup{
  on_attach = require'completion'.on_attach;
  settings = {
    solargraph = {
      autoformat=false;
      completion=true;
      diagnostics=false;
    }
  }
}

-- javascript/typescript
require'lspconfig'.tsserver.setup{
  on_attach=require'completion'.on_attach
}

-- html
require'lspconfig'.html.setup{
  on_attach=require'completion'.on_attach
}

-- css/sass
require'lspconfig'.cssls.setup{
  on_attach=require'completion'.on_attach
}

-- docker
require'lspconfig'.dockerls.setup{
  on_attach=require'completion'.on_attach
}
