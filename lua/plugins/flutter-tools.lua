return {
	enabled = false,
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	keys = {
		{ "<leader>F", "<cmd>Telescope flutter commands<cr>", desc = "Flutter Commands" },
	},
	config = function()
		require("flutter-tools").setup()
		require("telescope").load_extension("flutter")
	end,
}
