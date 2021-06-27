DefaultTerminal = require('nvim-terminal').DefaultTerminal;

terminal = DefaultTerminal

local silent = { silent = true  }

vim.api.nvim_set_keymap('n', '<leader>t', ':lua terminal:toggle()<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>1', ':lua terminal:open(1)<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>2', ':lua terminal:open(2)<cr>', silent)
vim.api.nvim_set_keymap('n', '<leader>3', ':lua terminal:open(3)<cr>', silent)

local Terminal = require('nvim-terminal').Terminal
local Window = require('nvim-terminal').Window

local window = Window:new({
    pos = 'botright',
    split = 'sp',
    width = 50,
    height = 15
})

terminal = Terminal:new(window)
