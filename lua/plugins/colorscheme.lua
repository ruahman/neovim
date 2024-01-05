local function config()
	vim.cmd([[colorscheme nightfox]])
	vim.api.nvim_exec(
		[[
    hi CursorLine cterm=NONE ctermbg=NONE guibg=#2e3440
  ]],
		false
	)
end

return { "EdenEast/nightfox.nvim", config = config }
