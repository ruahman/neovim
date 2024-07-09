-- quick highlight of the jump targets

local function config()
	vim.cmd([[highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline]])
	vim.cmd([[highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline]])
end

-- return export
return {
	"unblevable/quick-scope",
	lazy = true,
	event = { "BufRead", "BufNewFile" },
	config = config,
}
