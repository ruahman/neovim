-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = require("plugins.comment").config,
	},
	{ "tpope/vim-surround", event = "VeryLazy" },
	{
		"ggandor/leap.nvim",
		config = require("plugins.leap").config,
	},
	{
		"unblevable/quick-scope",
		event = "VeryLazy",
		config = require("plugins.quick-scope").config,
	},
}, {
	defaults = {
		lazy = false,
	},
})
