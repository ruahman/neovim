return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufNewFile", "BufRead" },
	dependencies = {
		"HiPhish/rainbow-delimiters.nvim",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"wellle/targets.vim",
	},
	build = ":TSUpdate",
	config = function()
		local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
		parser_config.ejs = {
			install_info = {
				url = "~/tree-sitter-embedded-template", -- local path or git repo
				files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
				-- optional entries:
				branch = "main", -- default branch in case of git repo if different from master
				generate_requires_npm = false, -- if stand-alone parser without npm dependencies
				requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
			},
			filetype = "ejs", -- if filetype does not match the parser name
		}
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
				"dart",
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
