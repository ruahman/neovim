return {
	"tris203/precognition.nvim",
	opts = {
		startVisible = false,
		showBlankVirtLine = false,
	},
	keys = {
		{
			"<leader>p",
			function()
				require("precognition").toggle()
			end,
			desc = "toogle precognition",
		},
	},
}
