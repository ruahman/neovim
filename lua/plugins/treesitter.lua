local export = {}

function export.config()
	require("nvim-treesitter.configs").setup({

		-- A list of parser names, or "all"
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

		-- rainbow = {
		-- 	enable = true,
		-- 	extended_mode = true,
		-- 	max_file_lines = nil,
		-- },

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

		autotag = {
			enable = true,
			enable_rename = true,
			enable_close = true,
			-- enable_close_on_slash = true,
			filetypes = { "html", "xml", "jsx", "tsx", "typescript", "javascript" },
		},
	})
end

return export
