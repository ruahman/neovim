-- cool littl mini packages
return {
	"echasnovski/mini.nvim",
	-- version = "v0.17.0",
	version = vim.version.range("^0.17.0"),
	config = function()
		require("mini.basics").setup() -- a and i text objects
		require("mini.ai").setup() -- a and i text objects
		require("mini.surround").setup() -- surround
		require("mini.pairs").setup() -- autopairs
		require("mini.comment").setup() -- comment
		require("mini.bufremove").setup() -- comment
		require("mini.move").setup() -- text movement
		require("mini.icons").setup()
		require("mini.statusline").setup()
		require("mini.files").setup()
		require("mini.jump").setup()
		require("mini.jump2d").setup()
		require("mini.snippets").setup() -- snippets
		require("mini.tabline").setup() -- snippets
		-- require("mini.cursorword").setup() -- snippets
		-- require("mini.animate").setup() -- animate cursor an scrolling
	end,
	keys = {
		{
			"<leader>n",
			function()
				MiniFiles.open()
			end,
			desc = "Open mini.files",
			mode = "n",
		},
	},
}
