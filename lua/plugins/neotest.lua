local M = {}

function M.config()
  require("neotest").setup({
    adapters = {
      require("neotest-python"),
      require("neotest-dotnet"),
      require("neotest-go"),
      require("neotest-rust")
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
    require('neotest').summary.toggle()
  end)

  vim.keymap.set("n", "oo", function()
    require('neotest').output.open()
  end)
end

return M
