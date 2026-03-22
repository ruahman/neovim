return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.ai").setup() -- text objects
		require("mini.surround").setup()
		require("mini.pairs").setup()
		require("mini.comment").setup()
		require("mini.icons").setup()
	end,
}
