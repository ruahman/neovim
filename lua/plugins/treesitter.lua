local export = {}

function export.config()
	require("nvim-treesitter.configs").setup({

		-- A list of parser names, or "all"
		ensure_installed = {
			"lua",
			"javascript",
			"typescript",
			"html",
			"tsx",
			"css",
			"python",
			"rust",
			"go",
		},
		auto_install = true,

		highlight = {
			enable = true,
		},

		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		},

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
			filetypes = { "html", "xml" },
		},
	})
end

return export
