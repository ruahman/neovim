-- A very fast, powerful, extensible and asynchronous Neovim HTTP client written in Lua.
return {
	"rest-nvim/rest.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			table.insert(opts.ensure_installed, "http")
		end,
	},
	config = function()
		-- first load extension
		require("telescope").load_extension("rest")

		-- select .env to load
		vim.keymap.set(
			"n",
			"<leader>v",
			require("telescope").extensions.rest.select_env,
			{ noremap = true, silent = false }
		)
	end,
}
