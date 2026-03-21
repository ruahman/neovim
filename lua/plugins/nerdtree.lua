local function config()
	require("nvim-tree").setup({
		sync_root_with_cwd = true,
		view = {
			side = "right",
		},
	})

	-- setup keymap
	vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
end

return {
	"kyazdani42/nvim-tree.lua",
	lazy = true,
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>" },
	},
	dependencies = {
		"kyazdani42/nvim-web-devicons",
	},
	config = config,
}
