return {
	"echasnovski/mini.nvim",
	version = "v0.17.0",
	config = function()
		require("mini.ai").setup() -- text objects
		require("mini.surround").setup()
		require("mini.pairs").setup()
		require("mini.comment").setup()
		require("mini.icons").setup()
		require("mini.statusline").setup()
		require("mini.files").setup()
	end,
	keys = {
		{
			"<leader>n",
			function()
				MiniFiles.open()
			end,
			desc = "Open mini.files",
			mode = "n",
		},
	},
}
