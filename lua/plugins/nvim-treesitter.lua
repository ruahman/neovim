return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"wellle/targets.vim",
	},
	branch = "main",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({})

		-- not sure this works
		require("nvim-treesitter.config").setup({
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"lua",
				"go",
				"rust",
				"javascript",
				"typescript",
				"python",
				"ruby",
				"c",
				"cpp",
				"zig",
				"json",
				"vim",
				"html",
				"http",
				"tsx",
				"css",
				"markdown",
				"markdown_inline",
			},
			auto_install = true,
		})
	end,
}
