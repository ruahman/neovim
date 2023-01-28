local M = {}

function M.config()
  local lspconfig = require("lspconfig")

  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

  local on_format = function()
    vim.lsp.buf.format({ async = true })
  end

  local on_attach = function()
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = 0 }) -- hover information
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 }) -- go to definition of function
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 }) -- go to definition of a type
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 }) -- go to implementaion of an interface or method
    vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { buffer = 0 }) -- list diagnostics
    vim.keymap.set("n", "<leader>fr", require("telescope.builtin").lsp_references, { buffer = 0 }) -- show refrences hight lighted word
    -- vim.keymap.set('n', '<leader>gd', require("telescope.builtin").lsp_definitions)
    vim.keymap.set("n", "gf", on_format, { buffer = 0 }) -- format
    -- vim.keymap.set('n', '<leader>fi', require("telescope.builtin").lsp_implementations, { buffer = 0 })
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, { buffer = 0 }) -- explain errors
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
  lspconfig.csharp_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern("*.sln","*.csproj"),
  })

  -- lspconfig.omnisharp.setup {
  --     cmd = { "dotnet", vim.fn.stdpath("data") .. "/mason/packages/omnisharp/OmniSharp.dll" },

  --     -- Enables support for reading code style, naming convention and analyzer
  --     -- settings from .editorconfig.
  --     enable_editorconfig_support = true,

  --     -- If true, MSBuild project system will only load projects for files that
  --     -- were opened in the editor. This setting is useful for big C# codebases
  --     -- and allows for faster initialization of code navigation features only
  --     -- for projects that are relevant to code that is being edited. With this
  --     -- setting enabled OmniSharp may load fewer projects and may thus display
  --     -- incomplete reference lists for symbols.
  --     enable_ms_build_load_projects_on_demand = false,

  --     -- Enables support for roslyn analyzers, code fixes and rulesets.
  --     enable_roslyn_analyzers = false,

  --     -- Specifies whether 'using' directives should be grouped and sorted during
  --     -- document formatting.
  --     organize_imports_on_format = false,

  --     -- Enables support for showing unimported types and unimported extension
  --     -- methods in completion lists. When committed, the appropriate using
  --     -- directive will be added at the top of the current file. This option can
  --     -- have a negative impact on initial completion responsiveness,
  --     -- particularly for the first few completion sessions after opening a
  --     -- solution.
  --     enable_import_completion = false,

  --     -- Specifies whether to include preview versions of the .NET SDK when
  --     -- determining which version to use for project loading.
  --     sdk_include_prereleases = true,

  --     -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
  --     -- true
  --     analyze_open_documents_only = false,

  --     root_dir = lspconfig.util.root_pattern("*.sln","*.csproj"),
  -- }

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
