
local export = {}

function export.config()
  vim.cmd[[au VimEnter * highlight QuickScopePrimary guifg='yellow' gui=underline ctermfg=155 cterm=underline]]
  vim.cmd[[au VimEnter * highlight QuickScopeSecondary guifg='orange' gui=underline ctermfg=81 cterm=underline]]
end

return export
