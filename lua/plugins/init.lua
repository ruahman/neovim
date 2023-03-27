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

-- Get platform depended build script for tabnine
local function get_tabnine_build_string()
  if vim.fn.has("win32") == 1 then
    -- use special windows path
    return "pwsh.exe -file .\\dl_binaries.ps1"
  else
    -- unix path
    return "./dl_binaries.sh"
  end
end

require("lazy").setup({
  { "haishanh/night-owl.vim", lazy = true },
  { "folke/tokyonight.nvim",  lazy = true },
  { "EdenEast/nightfox.nvim", config = require("plugins.colorscheme").config },
  { "jiangmiao/auto-pairs",   event = "VeryLazy" },
  { "romainl/vim-cool",       event = "VeryLazy" },
  { "moll/vim-bbye",          event = "VeryLazy" },
  { "tpope/vim-surround",     event = "VeryLazy" },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = require("plugins.comment").config,
  },
  { "tpope/vim-fugitive",                  event = "VeryLazy" },
  { "lewis6991/gitsigns.nvim",             event = "VeryLazy", config = require("plugins.gitsigns").config },
  { "wellle/targets.vim",                  event = "VeryLazy" },
  { "lukas-reineke/indent-blankline.nvim", event = "VeryLazy", config = require("plugins.indent-blankline").config },
  { "phaazon/hop.nvim",                    event = "VeryLazy", config = require("plugins.hop").config },
  { "unblevable/quick-scope",              event = "VeryLazy", config = require("plugins.quick-scope").config },
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
    event = "VeryLazy",
    config = require("plugins.bufferline").config,
  },
  { "hoob3rt/lualine.nvim", config = require("plugins.lualine").config },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = require("plugins.telescope").config,
  },
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = require("plugins.trouble").config,
  },
  {
    "akinsho/toggleterm.nvim",
    tag = "v2.2.1",
    keys = {
      { "<c-\\>", "ToggleTerm" },
    },
    config = require("plugins.toogleterm").config,
  },
  { "goolord/alpha-nvim",   config = require("plugins.dashboard").config },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    event = "InsertEnter",
    config = require("plugins.luasnip").config,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    event = "InsertEnter",
    config = require("plugins.nvim-cmp").config,
  },
  {
    "neovim/nvim-lspconfig",
    event = "InsertEnter",
    config = require("plugins.lsp").config,
  },
  { "jose-elias-alvarez/null-ls.nvim", config = require("plugins.null-ls").config },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
    },
    event = "InsertEnter",
    config = require("plugins.nvim-dap").config,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "Issafalcon/neotest-dotnet",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
    },
    event = "VeryLazy",
    config = require("plugins.neotest").config,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = require("plugins.mason").config,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "p00f/nvim-ts-rainbow",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = require("plugins.treesitter").config,
  },
  {
    "vimwiki/vimwiki",
    keys = {
      { "<leader>ww", "<cmd>VimwikiIndex<cr>" },
    },
    config = require("plugins.vimwiki").config,
  },
  {
    "codota/tabnine-nvim",
    config = require("plugins.tabnine").config,
    build = get_tabnine_build_string(),
  },
}, {
  defaults = {
    lazy = false,
  },
})
