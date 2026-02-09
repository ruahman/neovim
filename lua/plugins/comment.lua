-- cool comment plugin
return {
	"numToStr/Comment.nvim",
	event = { "BufNewFile", "BufRead" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = true,
}
