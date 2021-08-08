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

-- ocaml
-- require'lspconfig'.ocamllsp.setup{}

-- docker
require'lspconfig'.dockerls.setup{
  on_attach=require'completion'.on_attach
}

---- javascript/typescript
--require'lspconfig'.tsserver.setup{
--  on_attach=require'completion'.on_attach
--}

---- css/html

---- Neovim does not currently include built-in snippets. 
---- vscode-css-languageserver only provides completions 
---- when snippet support is enabled. 
---- To enable completion, install a snippet plugin and add the following 
---- override to your language client capabilities during setup.

--local lsp_config = require("lspconfig")
--local lsp_completion = require("completion")

----Enable completion
--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.completion.completionItem.snippetSupport = true

--local general_on_attach = function(client, bufnr)
--  if client.resolved_capabilities.completion then
--    lsp_completion.on_attach(client, bufnr)
--  end
--end

---- Setup basic lsp servers
--for _, server in pairs({"html", "cssls"}) do
--  lsp_config[server].setup {
--    -- Add capabilities
--    capabilities = capabilities,
--    on_attach = general_on_attach
--  }
--end
