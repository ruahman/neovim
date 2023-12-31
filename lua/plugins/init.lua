-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "plugins.treesitter" },
	{ import = "plugins.lsp" },
	{ import = "plugins.nvim-cmp" },
	{ import = "plugins.dashboard" },
	{ import = "plugins.lualine" },
	{ import = "plugins.telescope" },
	{ import = "plugins.mason" },
	{ import = "plugins.mason-tool-installer" },
	{ import = "plugins.bufferline" },
	{ import = "plugins.nerdtree" },
	{ import = "plugins.colorscheme" },
	{ import = "plugins.formatter" },
	{ import = "plugins.comment" },
	{ import = "plugins.linter" },
	{ import = "plugins.indent-blankline" },
	{ import = "plugins.quick-scope" },
	{ import = "plugins.colorizer" },
	{ import = "plugins.gitsigns" },
	{ import = "plugins.terminal" },
	{ import = "plugins.bookmarks" },
	{ import = "plugins.luasnip" },
	{ import = "plugins.copilot" },
	{ import = "plugins.dap" },
	{ "tpope/vim-fugitive", event = { "BufRead", "BufNewFile" } },
	{ "romainl/vim-cool", event = { "BufRead", "BufNewFile" } },
	{ "folke/flash.nvim", event = { "BufRead", "BufNewFile" } },
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = { map_cr = true } },
	{ "tpope/vim-surround", event = "InsertEnter" },
}, {
	defaults = {
		lazy = false,
	},
	checker = {
		enabled = true,
		notify = true,
	},
	change_detection = {
		notify = true,
	},
})
