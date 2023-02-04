local M = {}

function M.config()
  -- get neotest namespace (api call creates or returns namespace)
  local neotest_ns = vim.api.nvim_create_namespace("neotest")
  vim.diagnostic.config({
    virtual_text = {
      format = function(diagnostic)
        local message =
          diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
        return message
      end,
    },
  }, neotest_ns)

  require("neotest").setup({
    adapters = {
      require("neotest-python"),
      require("neotest-dotnet"),
      require("neotest-go")
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

  vim.keymap.set("n", "st", function()
    require('neotest').summary.toggle()
  end)

  vim.keymap.set("n", "oo", function()
    require('neotest').output.open()
  end)

  vim.keymap.set("n", "pt", function()
    require('neotest').output_panel.toggle()
  end)
end

return M
