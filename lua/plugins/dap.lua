local dap = require('dap')

-- dap.set_log_level('TRACE')

-- dap.adapters.python = {
--   type = 'executable';
--   command = '~/.pyenv/shims/python';
--   args = { '-m', 'debugpy.adapter' };
-- }

-- dap.configurations.python = {
--   {
--     type = 'python';
--     request = 'launch';
--     name = "Launch file";
--     program = "${file}";
--     pythonPath = function()
--       return '~/.pyenv/shims/python'
--     end
--   }
-- }

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
