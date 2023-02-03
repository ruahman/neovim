local M = {}

function M.config()
  local lspconfig = require("lspconfig")

  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local on_format = function()
    vim.lsp.buf.format({ async = true })
  end

  local on_attach = function(client, bufnr)
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = 0 }) -- hover information
    vim.keymap.set("n", "gf", on_format, { buffer = 0 }) -- format
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, { buffer = 0 }) -- explain errors
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 }) -- go to definition of function
    vim.keymap.set('n', '<leader>fd', require("telescope.builtin").lsp_definitions)
    -- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 }) -- go to definition of a type
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 }) -- go to implementaion of an interface or method
    -- vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { buffer = 0 }) -- list diagnostics
    -- vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, { buffer = 0 }) -- show refrences hight lighted word
    -- vim.keymap.set('n', '<leader>gd', require("telescope.builtin").lsp_definitions)
    vim.keymap.set('n', '<leader>fi', require("telescope.builtin").lsp_implementations, { buffer = 0 })
  end

  -- lua
  lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "s", "fmt", "i" },
        },
      },
    },
  })

  -- dart
  lspconfig.dartls.setup({
    on_attach = on_attach,
    capabilities = capabilities
  })

  -- golang
  lspconfig.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("go.mod"),
  })

  -- rust
  lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("Cargo.toml"),
  })

  -- c/cpp
  lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("*.c", "*.cpp"),
  })

  -- python
  lspconfig.pylsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- deno
  lspconfig.denols.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("deno.json"),
  })

  -- csharp
  -- lspconfig.csharp_ls.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   root_dir = lspconfig.util.root_pattern("*.sln","*.csproj"),
  -- })

  lspconfig.omnisharp.setup({
    on_attach=function(client, bufnr)
      on_attach(client, bufnr)
      client.server_capabilities.semanticTokensProvider = {
        full = vim.empty_dict(),
        legend = {
          tokenModifiers = { "static_symbol" },
          tokenTypes = {
            "comment",
            "excluded_code",
            "identifier",
            "keyword",
            "keyword_control",
            "number",
            "operator",
            "operator_overloaded",
            "preprocessor_keyword",
            "string",
            "whitespace",
            "text",
            "static_symbol",
            "preprocessor_text",
            "punctuation",
            "string_verbatim",
            "string_escape_character",
            "class_name",
            "delegate_name",
            "enum_name",
            "interface_name",
            "module_name",
            "struct_name",
            "type_parameter_name",
            "field_name",
            "enum_member_name",
            "constant_name",
            "local_name",
            "parameter_name",
            "method_name",
            "extension_method_name",
            "property_name",
            "event_name",
            "namespace_name",
            "label_name",
            "xml_doc_comment_attribute_name",
            "xml_doc_comment_attribute_quotes",
            "xml_doc_comment_attribute_value",
            "xml_doc_comment_cdata_section",
            "xml_doc_comment_comment",
            "xml_doc_comment_delimiter",
            "xml_doc_comment_entity_reference",
            "xml_doc_comment_name",
            "xml_doc_comment_processing_instruction",
            "xml_doc_comment_text",
            "xml_literal_attribute_name",
            "xml_literal_attribute_quotes",
            "xml_literal_attribute_value",
            "xml_literal_cdata_section",
            "xml_literal_comment",
            "xml_literal_delimiter",
            "xml_literal_embedded_expression",
            "xml_literal_entity_reference",
            "xml_literal_name",
            "xml_literal_processing_instruction",
            "xml_literal_text",
            "regex_comment",
            "regex_character_class",
            "regex_anchor",
            "regex_quantifier",
            "regex_grouping",
            "regex_alternation",
            "regex_text",
            "regex_self_escaped_character",
            "regex_other_escape",
          },
        },
        range = true,
      }
    end,
    cmd = {"/home/ruahman/.local/share/nvim/mason/bin/omnisharp", "--languageserver"}
  })

  -- format on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.ts",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.js",
    callback = on_format,
  })

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.cs",
    callback = on_format,
  })
end

return M
