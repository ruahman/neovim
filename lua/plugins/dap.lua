local dap = require('dap')

-- dap.set_log_level('TRACE')

-- lldb c/c++/rust
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode-10', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.rust = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      -- load the debug file that was created using ( cargo build )
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.c = {
  {
    name = 'Launch',
    type = 'lldb',
    request = 'launch',
    program = function()
      -- load the debug file that was created using (clang -g )
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

require'dap-go'.setup()
require('dap-python').setup('/home/ruahman/.pyenv/shims/python')

require'nvim-dap-virtual-text'.setup()

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

vim.keymap.set('n', '<leader>b', require'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>c', require'dap'.continue)
vim.keymap.set('n', '<leader>s', require'dap'.step_into)
vim.keymap.set('n', '<leader>n', require'dap'.step_over)
vim.keymap.set('n', '<leader>u', require'dapui'.toggle)
