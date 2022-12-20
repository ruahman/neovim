local M = {}

function M.config()
  local dap = require("dap")

  dap.set_log_level("TRACE")

  -- setup lldb for c/c++/rust
  dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode-14", -- comes with install of lldb
    name = "lldb",
  }

  -- c
  dap.configurations.c = {
    {
      name = "Debug",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
    },
  }

  -- cpp
  dap.configurations.cpp = dap.configurations.c

  -- rust
  dap.configurations.rust = {
    {
      name = "Debug",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
    },
    {
      name = "Debug Test",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/deps/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
    },
  }

  -- setup debugger for dotnet
  dap.adapters.coreclr = {
    type = 'executable',
    command = '/home/ruahman/.local/share/nvim/mason/bin/netcoredbg',
    args = {'--interpreter=vscode'},
  }

  -- csharp
  dap.configurations.cs = {
	  {
      type = "coreclr",
      name = "launch - netcoredbg",
      request = "launch",
      program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
      end,
	  },
	}

  -- debugger for dart
  dap.adapters.dart = {
    type = "executable",
    command = "dart",
    args = {"debug_adapter"}
  }

  -- debuge configurations 
  dap.configurations.dart = {
    {
      type = "dart",
      request = "launch",
      name = "Launch Dart Program",
      program = "${file}",
      cwd = "${workspaceFolder}",
      args = {"--help"},
    }
  }

  --dap go
  require("dap-go").setup() -- must have delve installed globaly

  --dap python
  require("dap-python").setup() -- must have debugpy installed globaly

  require("nvim-dap-virtual-text").setup()

  --DAPUI
  require("dapui").setup({
    layouts = {
      {
        elements = {
          -- Elements can be strings or table with id and size keys.
          { id = "scopes", size = 0.25 },
          "watches",
          "stacks",
        },
        size = 40, -- 40 columns
        position = "left",
      },
      {
        elements = {
          "repl",
        },
        size = 0.25, -- 25% of total lines
        position = "bottom",
      },
    },
  })

  vim.keymap.set("n", "gb", require("dap").toggle_breakpoint)
  vim.keymap.set("n", "gx", require("dap").continue)
  vim.keymap.set("n", "gi", require("dap").step_into)
  vim.keymap.set("n", "gs", require("dap").step_over)
  vim.keymap.set("n", "go", require("dap").step_out)
  vim.keymap.set("n", "gr", require("dap").repl.toggle)
  vim.keymap.set("n", "gu", require("dapui").toggle)
end

return M
