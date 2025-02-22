-- cool comment plugin
-- gc = comment
return {
	"numToStr/Comment.nvim",
	event = { "BufNewFile", "BufRead" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = true,
}
