local M = {}

function M.config()
  require("neotest").setup({
    adapters = {
      require("neotest-python"),
      require("neotest-dotnet")
    }
  })
  vim.keymap.set("n", "dr", function()
    require('neotest').run.run()
  end)
  -- vim.keymap.set("n", "dn", require("dap-python").test_method)
  vim.keymap.set("n", "dn", function()
    require('neotest').run.run({strategy = "dap"})
  end)
  vim.keymap.set("n", "dx", function()
    require("neotest").run.run(vim.fn.expand("%"))
  end)
  vim.keymap.set("n", "so", function()
    require('neotest').summary.open()
  end)
  vim.keymap.set("n", "sc", function()
    require('neotest').summary.close()
  end)
  vim.keymap.set("n", "oo", function()
    require('neotest').output.open()
  end)
end

return M
