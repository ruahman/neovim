return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufNewFile", "BufRead" },
	dependencies = {
		"HiPhish/rainbow-delimiters.nvim",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
		"wellle/targets.vim",
	},
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"dart",
			"javascript",
			"json",
			"vim",
			"typescript",
			"html",
			"tsx",
			"css",
			"python",
			"ruby",
			"rust",
			"go",
			"c_sharp",
			"c",
			"cpp",
			"zig",
			"markdown",
			"markdown_inline",
		},

		auto_install = true,

		highlight = { enable = true },

		indent = { enable = true },

		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				},
			},
		},
	},
	config = true,
}
