-- shows a thin vertical line at each indent level
return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufRead", "BufNewFile" },
	main = "ibl",
	config = true,
	enabled = true,
}
