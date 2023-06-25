local M = {}

function M.config()
  local lspconfig = require("lspconfig")

  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- setup keybindings for this buffer
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "gf", function()
      vim.lsp.buf.format({ async = true })
    end, bufopts)
    vim.keymap.set("n", "<leader>fd", require("telescope.builtin").lsp_definitions, bufopts)
    vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, bufopts)
    vim.keymap.set("n", "<leader>fi", require("telescope.builtin").lsp_implementations, bufopts)
  end

  local ext = ""
  if vim.loop.os_uname().sysname == "Windows_NT" then
    ext = ".cmd"
  end

  lspconfig.lua_ls.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" .. ext },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          enable = false,
        },
      },
    },
  })

  -- golang
  lspconfig.gopls.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/gopls" .. ext },
    on_attach = on_attach,
    capabilities = capabilities,
    -- root_dir = lspconfig.util.root_pattern("go.mod","*.go"),
  })

  -- rust
  lspconfig.rust_analyzer.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/rust-analyzer" .. ext },
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("Cargo.toml"),
  })

  -- c/cpp
  lspconfig.clangd.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/clangd" .. ext },
    on_attach = on_attach,
    capabilities = capabilities,
    -- root_dir = lspconfig.util.root_pattern("*.c", "*.cpp"),
  })

  -- typescript
  lspconfig.tsserver.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/typescript-language-server" .. ext, "--stdio" },
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      preferences = {
        disableSuggestions = true,
      },
    },
  })

  -- python
  lspconfig.pylsp.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/pylsp" .. ext },
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- zig
  lspconfig.zls.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/zls" .. ext },
    on_attach = on_attach,
    capabilities = capabilities,
  })

  -- csharp, do I still need to do this
  lspconfig.omnisharp.setup({
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/omnisharp" },
    -- Enables support for reading code style, naming convention and analyzer
    -- settings from .editorconfig.
    enable_editorconfig_support = true,
    -- Specifies whether 'using' directives should be grouped and sorted during
    -- document formatting.
    organize_imports_on_format = false,
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)

      -- Semantic tokens do not conform to the LSP specification
      -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
      -- https://github.com/neovim/neovim/issues/21391
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
  })

  -- format on save
  local on_format = function()
    vim.lsp.buf.format({ async = false })
  end

  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = on_format,
  })
end

return M
