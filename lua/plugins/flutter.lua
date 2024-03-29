return {
	"mskelton/flutter.nvim",
	dependencies = { "neovim/nvim-lspconfig" },
	config = true,
	hot_reload = true, -- Hot reload automatically on save
	closing_labels = {
		highlight = "Comment", -- highlight for the closing label
		prefix = "// ", -- character(s) to use for close label e.g. // Widget
		enabled = true, -- set to false to disable
	},
}
