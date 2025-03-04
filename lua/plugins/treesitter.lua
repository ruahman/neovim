return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufNewFile", "BufRead" },
	dependencies = {
		-- "HiPhish/rainbow-delimiters.nvim",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"wellle/targets.vim",
	},
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
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
				"c_sharp",
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
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
