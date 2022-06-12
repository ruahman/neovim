local dap = require('dap')
local map = require'utils'.map

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

map('n', '<leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
map('n', '<leader>c', "<cmd>lua require'dap'.continue()<CR>")
map('n', '<leader>s', "<cmd>lua require'dap'.step_into()<CR>")
map('n', '<leader>n', "<cmd>lua require'dap'.step_over()<CR>")
map('n', '<leader>t', "<cmd>lua require'dap-go'.debug_test()<CR>")
-- map('n', '<leader>r', "<cmd>lua require'dap'.repl.toggle()<CR>")
map('n', '<leader>u', "<cmd>lua require'dapui'.toggle()<CR>")

