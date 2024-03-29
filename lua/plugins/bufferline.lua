local function config()
	local map = require("utils").map

	require("bufferline").setup({
		options = {
			close_command = "Bdelete! %d",
			offsets = {
				{
					filetype = "NvimTree",
					text = "nvim-tree",
					highlight = "Directory",
					text_align = "left",
				},
			},
			diagnostics = "nvim_lsp",
		},
	})

	map("n", "<S-l>", ":BufferLineCycleNext<CR>")
	map("n", "<S-right>", ":BufferLineCloseRight<CR>")

	map("n", "<S-h>", ":BufferLineCyclePrev<CR>")
	map("n", "<S-left>", ":BufferLineCloseLeft<CR>")

	map("n", "bd", ":Bdelete<CR>")
end

return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
		"famiu/bufdelete.nvim",
	},
	config = config,
}
