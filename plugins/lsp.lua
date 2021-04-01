-- require'lspconfig'.pyright.setup{}
require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}

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

require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}

require'lspconfig'.dockerls.setup{on_attach=require'completion'.on_attach}

-- require'lspconfig'.sqlls.setup{
--   on_attach=require'completion'.on_attach;
--   cmd = {"sql-language-server","up","--method","stdio"}
-- }
