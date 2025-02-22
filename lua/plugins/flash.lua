-- lets you navigate your code with search labels, enhanced character motions, and Treesitter integration.
-- a very fast was to search throught your code
return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"<leader><leader>",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
	},
}
