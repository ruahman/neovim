local M = {}

function M.config()
  require("neotest").setup({
    adapters = {
      require("neotest-dotnet")
    }
  })
end

return M
