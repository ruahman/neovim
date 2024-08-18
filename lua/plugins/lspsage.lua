-- improve lsp experences in neovim

local map = require("utils").map

return {
	"nvimdev/lspsaga.nvim",
	config = function()
		map("n", "<leader>gh", ":Lspsaga hover_doc<CR>")
		map("n", "<leader>gd", ":Lspsaga finder<CR>")
		map("n", "<leader>go", ":Lspsaga outline<CR>")
		map("n", "<leader>ca", ":Lspsaga code_action<CR>")
		require("lspsaga").setup({
			lightbulb = {
				enabled = false,
				sign = true,
				virtual_text = false,
				debounce = 10,
				sign_priority = 20,
			},
			ui = {
				code_action = " ",
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	enabled = false,
}
