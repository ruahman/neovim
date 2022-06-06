utils = require'utils'
local cmd = utils.cmd

vim.cmd[[au VimEnter * highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline]]
vim.cmd[[au VimEnter * highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline]]
