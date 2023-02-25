local export = {}

function export.config()
  local null_ls = require("null-ls")

  local sources = {
    null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.formatting.yapf,
    -- null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.luacheck,
  }

  null_ls.setup({
    sources = sources,
  })
end

return export
