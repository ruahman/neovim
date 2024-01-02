return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufNewFile", "BufRead" },
	dependencies = {
		"HiPhish/rainbow-delimiters.nvim",
		"windwp/nvim-ts-autotag",
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
					["ap"] = "@parameter.outer",
					["ip"] = "@parameter.inner",
				},
			},
		},

		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			-- enable_close_on_slash = true,
			filetypes = { "html", "xml", "jsx", "tsx", "typescript", "javascript" },
		},
	},
	config = true,
}
