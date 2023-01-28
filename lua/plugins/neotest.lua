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

  vim.keymap.set("n", "dn", function()
    require('neotest').run.run({strategy = "dap"})
  end)

  vim.keymap.set("n", "dx", function()
    require("neotest").run.run(vim.fn.expand("%"))
  end)

  vim.keymap.set("n", "so", function()
    if vim.g.summary_tests == true then
      require('neotest').summary.close()
      vim.g.summary_tests = false
    else
      require('neotest').summary.open()
      vim.g.summary_tests = true
    end
  end)

  vim.keymap.set("n", "oo", function()
    require('neotest').output.open()
  end)
end

return M
