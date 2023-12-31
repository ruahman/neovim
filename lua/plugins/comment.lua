local function config()
	require("Comment").setup()
end

return {
	"numToStr/Comment.nvim",
	event = { "BufNewFile", "BufRead" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = config,
}
