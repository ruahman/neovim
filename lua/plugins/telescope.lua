local function config()
	require("telescope").setup({
		defaults = {
			mappings = {
				n = {
					["bd"] = require("telescope.actions").delete_buffer,
				},
				i = {
					["bd"] = require("telescope.actions").delete_buffer,
				},
			},
		},
	})

	-- load faster fuzy finder
	require("telescope").load_extension("fzf")

	local builtin = require("telescope.builtin")

	vim.keymap.set("n", "<leader>f", function()
		builtin.find_files({ hidden = true, no_ignore = true })
	end) -- list files

	vim.keymap.set("n", "<leader>b", builtin.buffers) -- list buffers
	vim.keymap.set("n", "<leader>s", builtin.current_buffer_fuzzy_find) -- search in buffer
	vim.keymap.set("n", "<leader>r", builtin.live_grep) -- grep in dir
	vim.keymap.set("n", "<leader>g", builtin.git_status) -- git status
	vim.keymap.set("n", "<leader>j", builtin.jumplist) -- jumplist
	-- vim.keymap.set("n", "<leader>cm", builtin.commands) -- nvim commands
	-- vim.keymap.set("n", "<leader>mk", builtin.marks) -- marks
end

return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = config,
}
