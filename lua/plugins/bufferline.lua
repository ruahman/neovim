local function config()
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
	vim.keymap.set("n", "<S-Left>", ":BufferLineCyclePrev<CR>", { noremap = true })
	-- cycle next
	vim.keymap.set("n", "<S-Right>", ":BufferLineCycleNext<CR>", { noremap = true })

	-- move prev
	vim.keymap.set("n", "<S-h>", ":BufferLineMovePrev<CR>", { noremap = true })
	-- move next
	vim.keymap.set("n", "<S-l>", ":BufferLineMoveNext<CR>", { noremap = true })

	-- close other buffers
	vim.keymap.set("n", "<C-x>", ":BufferLineCloseOthers<CR>", { noremap = true })

	-- delete buffer
	vim.keymap.set("n", "bd", ":Bdelete<CR>", { noremap = true })
end

return {
	enabled = false,
	"akinsho/bufferline.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
		"famiu/bufdelete.nvim",
	},
	config = config,
}
