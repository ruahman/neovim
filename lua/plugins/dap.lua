local dap = require('dap')

-- dap.set_log_level('TRACE')

dap.adapters.python = {
  type = 'executable';
  command = '/home/ruahman/.pyenv/shims/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return '/home/ruahman/.pyenv/shims/python'
    end
  }
}

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
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

require'dap-go'.setup()
require'dapui'.setup()
require'nvim-dap-virtual-text'.setup()

vim.keymap.set('n', '<leader>b', require'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>c', require'dap'.continue)
vim.keymap.set('n', '<leader>s', require'dap'.step_into)
vim.keymap.set('n', '<leader>n', require'dap'.step_over)
-- vim.keymap.set('n', '<leader>t', require'dap-go'.debug_test)
-- map('n', '<leader>r', "<cmd>lua require'dap'.repl.toggle()<CR>")
vim.keymap.set('n', '<leader>u', require'dapui'.toggle)
