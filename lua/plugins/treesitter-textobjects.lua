return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	enable = true,
	lazy = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						-- functions definitions
						["aF"] = {
							query = "@function.outer",
							desc = "Select outer part of a method/function definition",
						},
						["iF"] = {
							query = "@function.inner",
							desc = "Select inner part of a method/function definition",
						},

						-- classes definitions
						["aC"] = { query = "@class.outer", desc = "Select outer part of a class" },
						["iC"] = { query = "@class.inner", desc = "Select inner part of a class" },

						-- function calls
						["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
						["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

						-- function parameters/arugments
						["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
						["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

						-- assignments
						["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
						["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
						["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
						["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

						-- conditionals
						["ac"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
						["ic"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

						-- loops
						["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
						["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },
					},
				},
			},
		})
	end,
}
