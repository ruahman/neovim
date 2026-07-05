-- tells you which key you are thinking of
return {
	"folke/which-key.nvim",
	opts = {
		delay = 1000,
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
