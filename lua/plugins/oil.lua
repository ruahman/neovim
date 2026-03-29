return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	keys = {
		{ "<leader>o", "<cmd>Oil<CR>", desc = "Open file explorer" },
	},
	config = function()
		require("oil").setup()
	end,
	dependencies = { "nvim-mini/mini.icons" },
}
