-- colorscheme for my neovim
local function config()
	vim.cmd([[colorscheme nightfox]])
	vim.api.nvim_exec(
		[[
    hi CursorLine cterm=NONE ctermbg=NONE guibg=#2e3440
  ]],
		false
	)
end

return {
	{
		"EdenEast/nightfox.nvim",
		config = config,
	},
	{
		"morhetz/gruvbox",
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"catppuccin/nvim",
	},
}
