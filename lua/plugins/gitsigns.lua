local function config()
	require("gitsigns").setup({
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "➤" },
			topdelete = { text = "➤" },
			changedelete = { text = "▎" },
		},
	})
end

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufRead", "BufNewFile" },
	config = config,
}
