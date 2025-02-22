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

	-- cycle prev
	map("n", "<S-Left>", ":BufferLineCyclePrev<CR>")
	-- cycle next
	map("n", "<S-Right>", ":BufferLineCycleNext<CR>")

	-- move prev
	map("n", "<S-h>", ":BufferLineMovePrev<CR>")
	-- move next
	map("n", "<S-l>", ":BufferLineMoveNext<CR>")

	-- close other buffers
	map("n", "<C-x>", ":BufferLineCloseOthers<CR>")

	-- delete buffer
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
