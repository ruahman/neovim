local dap = require('dap')

-- dap.set_log_level('TRACE')

-- dap.adapters.ruby = {
--   type = 'executable';
--   command = 'bundle';
--   args = {'exec', 'readapt', 'stdio'};
-- }

-- dap.configurations.ruby = {
--   {
--     type = 'ruby';
--     request = 'launch';
--     name = 'Rails';
--     program = 'bundle';
--     programArgs = {'exec', 'rails', 's'};
--     useBundler = true;
--   },
-- }

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
-- require('dap-ruby').setup()

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console"
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})

require'nvim-dap-virtual-text'.setup()

vim.keymap.set('n', '<leader>b', require'dap'.toggle_breakpoint)
vim.keymap.set('n', '<leader>c', require'dap'.continue)
vim.keymap.set('n', '<leader>s', require'dap'.step_into)
vim.keymap.set('n', '<leader>n', require'dap'.step_over)
vim.keymap.set('n', '<leader>u', require'dapui'.toggle)
