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

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"p00f/nvim-ts-rainbow",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = require("plugins.treesitter").config,
		version = "v0.9.0",
	},
	{
		"neovim/nvim-lspconfig",
		config = require("plugins.lsp").config,
	},
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
	-- { "jose-elias-alvarez/null-ls.nvim",           config = require("plugins.null-ls").config },
	{ "stevearc/conform.nvim", config = require("plugins.conform").config },
	{ "mfussenegger/nvim-lint", config = require("plugins.nvim-lint").config },
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		config = require("plugins.mason").config,
		version = "v1.5.0",
	},
	{ "WhoIsSethDaniel/mason-tool-installer.nvim", config = require("plugins.mason-tool-installer").config },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = require("plugins.telescope").config,
		version = "v0.1.2",
	},
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
	{
		"akinsho/bufferline.nvim",
		tag = "v3.5.0",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			"famiu/bufdelete.nvim",
		},
		config = require("plugins.bufferline").config,
	},
	{ "hoob3rt/lualine.nvim", config = require("plugins.lualine").config },
	{ "goolord/alpha-nvim", config = require("plugins.dashboard").config },
	{
		"akinsho/toggleterm.nvim",
		tag = "v2.2.1",
		keys = {
			{ "<c-\\>", "ToggleTerm" },
		},
		config = require("plugins.toogleterm").config,
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = require("plugins.comment").config,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = require("plugins.indent-blankline").config,
	},
	"catppuccin/nvim",
	"folke/tokyonight.nvim",
	"haishanh/night-owl.vim",
	{ "EdenEast/nightfox.nvim", config = require("plugins.colorscheme").config },
	-- cool git plugin
	{ "tpope/vim-fugitive", event = "VeryLazy" },
	-- insert or delete brackets, parens, quotes in pair.
	{ "jiangmiao/auto-pairs", event = "VeryLazy" },
	-- disables search highlighting when you are done searching and re-enables it when you search again.
	{ "romainl/vim-cool", event = "VeryLazy" },
	-- Bbye gives you :Bdelete which allows you to do delete buffers (close files) without closing your windows or messing up your layout.
	{ "moll/vim-bbye", event = "VeryLazy" },
	-- easily delete, change and add surroundings in pairs.
	{ "tpope/vim-surround", event = "VeryLazy" },
	-- Targets.vim is a Vim plugin that adds various text objects to give you more targets to operate on.
	{ "wellle/targets.vim", event = "VeryLazy" },
	-- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.
	-- {
	--   "phaazon/hop.nvim",
	--   event = "VeryLazy",
	--   config = require("plugins.hop").config,
	--   version = "v2.0.3",
	-- },
	{
		"ggandor/leap.nvim",
		config = require("plugins.leap").config,
	},
	-- change f and t behavior
	{
		"ggandor/flit.nvim",
		config = require("plugins.flit").config,
	},
	-- An always-on highlight for a unique character in every word on a line to help you use f, F and family.
	{
		"unblevable/quick-scope",
		event = "VeryLazy",
		config = require("plugins.quick-scope").config,
	},
	--  Super fast git decorations
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = require("plugins.gitsigns").config,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
		event = "InsertEnter",
		config = require("plugins.luasnip").config,
		version = "v1.2.1",
	},
	-- Microsoft Copilot
	{ "github/copilot.vim", config = require("plugins.copilot").config },
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
