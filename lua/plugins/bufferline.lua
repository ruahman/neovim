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

	map("n", "<S-n>", ":BufferLineCycleNext<CR>")
	map("n", "<S-l>", ":BufferLineMoveNext<CR>")

	map("n", "<S-p>", ":BufferLineCyclePrev<CR>")
	map("n", "<S-h>", ":BufferLineMovePrev<CR>")

	map("n", "<S-o>", ":BufferLineCloseOthers<CR>")

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
