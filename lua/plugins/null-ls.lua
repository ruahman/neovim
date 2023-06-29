local export = {}

function export.config()
  local null_ls = require("null-ls")

  local sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.luacheck,
    -- null_ls.builtins.formatting.prettier.with({ filetypes = { "javascript" } }),
    null_ls.builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.has_file(".eslintrc.js")
      end,
    }),
    null_ls.builtins.formatting.prettierd.with({
      condition = function(utils)
        return utils.has_file(".prettierrc.json")
      end,
    }),
  }

  null_ls.setup({
    sources = sources,
  })
end

return export
