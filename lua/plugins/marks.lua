-- A better user experience for interacting with and manipulating Vim marks.
return {
	enabled = true,
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {
		force_write_shada = true,
	},
	config = true,
}
