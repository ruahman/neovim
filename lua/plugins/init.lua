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
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"HiPhish/rainbow-delimiters.nvim",
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
		},
		build = ":TSUpdate",
		config = require("plugins.treesitter").config,
	},
	-- lsp
	{
		"neovim/nvim-lspconfig",
		config = require("plugins.lsp").config,
	},
	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer", -- buffer completion source for nvim-cmp
			"hrsh7th/cmp-path", -- file path completion source for nvim-cmp
			"hrsh7th/cmp-nvim-lua", -- nvim lua completion source for nvim-cmp
			"hrsh7th/cmp-nvim-lsp", -- nvim lsp completion source for nvim-cmp
			"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
			"onsails/lspkind.nvim",
			"David-Kunz/cmp-npm",
		},
		config = require("plugins.nvim-cmp").config,
	},
	-- conform
	{ "stevearc/conform.nvim", config = require("plugins.conform").config },
	-- nvim-lint
	{ "mfussenegger/nvim-lint", config = require("plugins.nvim-lint").config },
	-- mason
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = require("plugins.mason").config,
	},
	-- mason-tool-installer
	{ "WhoIsSethDaniel/mason-tool-installer.nvim", config = require("plugins.mason-tool-installer").config },
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = require("plugins.telescope").config,
	},
	-- nvim-tree
	{
		"kyazdani42/nvim-tree.lua",
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>" },
		},
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		config = require("plugins.nvim-tree").config,
	},
	-- bufferline
	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			"famiu/bufdelete.nvim",
		},
		config = require("plugins.bufferline").config,
	},
	-- lualine
	{ "hoob3rt/lualine.nvim", config = require("plugins.lualine").config },
	-- alpha-nvim : dashboard
	{ "goolord/alpha-nvim", config = require("plugins.dashboard").config },
	-- toogleterm
	{
		"akinsho/toggleterm.nvim",
		keys = {
			{ "<c-\\>", "ToggleTerm" },
		},
		config = require("plugins.toogleterm").config,
	},
	-- bookmarks.nvim
	{
		"crusj/bookmarks.nvim",
		keys = {
			{ "<tab><tab>", mode = { "n" } },
		},
		branch = "main",
		dependencies = { "nvim-web-devicons" },
		config = require("plugins.bookmarks").config,
	},
	-- comment.nvim
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = require("plugins.comment").config,
	},
	-- indent-blankline
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		config = require("plugins.indent-blankline").config,
	},
	-- nightfox colorscheme
	{ "EdenEast/nightfox.nvim", config = require("plugins.colorscheme").config },
	-- nvim-colorizer : add color to hex codes
	{ "norcalli/nvim-colorizer.lua", config = require("plugins.colorizer").config },
	-- cool git plugin : integrate git to nvim
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	-- insert or delete brackets, parens, quotes in pair.
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = { map_cr = true } },
	-- vim-cool : disables highlight when you move the cursor
	{ "romainl/vim-cool", event = "VeryLazy" },
	-- vim-surround : add, change, delete surroundings
	{ "tpope/vim-surround", event = "VeryLazy" },
	-- targets.vim : adds various text objects to give you more targets to operate on.
	{ "wellle/targets.vim", event = "VeryLazy" },
	-- leap.nvim : nvim version of vim-easymotion/vim-sneak
	{
		"ggandor/leap.nvim",
		dependencies = {
			"tpope/vim-repeat",
		},
		config = require("plugins.leap").config,
	},
	-- quick-scope : highlight for a unique character in every word on a line
	{
		"unblevable/quick-scope",
		event = "VeryLazy",
		config = require("plugins.quick-scope").config,
	},
	--  gitsigns : git decorations that show whether lines have been added, modified or removed
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = require("plugins.gitsigns").config,
	},
	-- luasnip
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		event = "InsertEnter",
		config = require("plugins.luasnip").config,
	},
	-- copilot
	{ "github/copilot.vim", config = require("plugins.copilot").config },
	-- nvim-dap
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"mfussenegger/nvim-dap-python",
			"leoluz/nvim-dap-go",
			-- "microsoft/vscode-js-debug",
		},
		config = require("plugins.nvim-dap").config,
	},
}, {
	defaults = {
		lazy = false,
	},
})
