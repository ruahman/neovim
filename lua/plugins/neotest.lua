local M = {}

function M.config()
  require("neotest").setup({
    adapters = {
      require("neotest-dotnet")
    }
  })
  vim.keymap.set("n", "dn", require("neotest").run.run())
end

return M
