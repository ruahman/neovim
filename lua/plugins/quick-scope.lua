utils = require'utils'
local cmd = utils.cmd
cmd[[au VimEnter * highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline]]
cmd[[au VimEnter * highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline]]

-- vim.highlight.create('QuickScopePrimary', {ctermfg=155, cterm=underline}, false)
-- vim.highlight.create('QuickScopeSecondary', {ctermfg=81, cterm=underline}, false)

