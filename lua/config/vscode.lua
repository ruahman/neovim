vim.opt.syntax = "on"
-- vim.opt.wrap = false

-- vim.opt.number = true
vim.opt.cursorline = true

-- insert space for tab
vim.opt.tabstop = 2

-- insert space for indent
vim.opt.shiftwidth = 2

-- insert space when in insert
vim.opt.softtabstop = 2

-- expand tabs to space
vim.opt.expandtab = true

vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

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
