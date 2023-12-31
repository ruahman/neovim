local function config()
	local map = require("utils").map

	require("nvim-tree").setup({
		sync_root_with_cwd = true,
		view = {
			side = "right",
		},
	})

	-- setup keymap
	map("n", "<Leader>e", ":NvimTreeToggle<CR>")
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
