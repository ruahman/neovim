-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = require("plugins.comment").config,
	},
	-- insert or delete brackets, parens, quotes in pair.
	-- { "jiangmiao/auto-pairs", event = "VeryLazy" },
	-- disables search highlighting when you are done searching and re-enables it when you search again.
	-- { "romainl/vim-cool", event = "VeryLazy" },
	-- easily delete, change and add surroundings in pairs.
	{ "tpope/vim-surround", event = "VeryLazy" },
	-- Targets.vim is a Vim plugin that adds various text objects to give you more targets to operate on.
	-- { "wellle/targets.vim", event = "VeryLazy" },
	{
		"ggandor/leap.nvim",
		config = require("plugins.leap").config,
	},
	-- An always-on highlight for a unique character in every word on a line to help you use f, F and family.
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
