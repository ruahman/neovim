-- A better user experience for interacting with and manipulating Vim marks.
return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {
		force_write_shada = true,
	},
	config = true,
	enabled = false,
}
