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
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "p00f/nvim-ts-rainbow",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nkrkv/nvim-treesitter-rescript",
    },
    config = require("plugins.treesitter").config,
  },
  {
    "neovim/nvim-lspconfig",
    config = require("plugins.lsp").config,
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
    -- event = "InsertEnter",
    config = require("plugins.nvim-cmp").config,
  },
  { "jose-elias-alvarez/null-ls.nvim", config = require("plugins.null-ls").config },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = require("plugins.mason").config,
  },
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
    -- lazy = true
    event = "VeryLazy",
  },
  { "hoob3rt/lualine.nvim",            config = require("plugins.lualine").config },
  { "goolord/alpha-nvim",              config = require("plugins.dashboard").config },
  {
    "akinsho/toggleterm.nvim",
    tag = "v2.2.1",
    keys = {
      { "<c-\\>", "ToggleTerm" },
    },
    -- event = "VeryLazy",
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
  { "EdenEast/nightfox.nvim", config = require("plugins.colorscheme").config },
  -- cool git plugin
  { "tpope/vim-fugitive",     event = "VeryLazy" },
  -- insert or delete brackets, parens, quotes in pair.
  { "jiangmiao/auto-pairs",   event = "VeryLazy" },
  -- disables search highlighting when you are done searching and re-enables it when you search again.
  { "romainl/vim-cool",       event = "VeryLazy" },
  -- Bbye gives you :Bdelete which allows you to do delete buffers (close files) without closing your windows or messing up your layout.
  { "moll/vim-bbye",          event = "VeryLazy" },
  -- easily delete, change and add surroundings in pairs.
  { "tpope/vim-surround",     event = "VeryLazy" },
  -- Targets.vim is a Vim plugin that adds various text objects to give you more targets to operate on.
  { "wellle/targets.vim",     event = "VeryLazy" },
  -- Hop is an EasyMotion-like plugin allowing you to jump anywhere in a document with as few keystrokes as possible.
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    config = require("plugins.hop").config,
  },
  -- An always-on highlight for a unique character in every word on a line to help you use f, F and family.
  { "unblevable/quick-scope",  event = "VeryLazy", config = require("plugins.quick-scope").config },
  -- A pretty list for showing diagnostics, references, telescope results, quickfix and location lists
  -- to help you solve all the trouble your code is causing.
  {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = require("plugins.trouble").config,
  },
  --  Super fast git decorations
  { "lewis6991/gitsigns.nvim", event = "VeryLazy", config = require("plugins.gitsigns").config },
  -- { "haishanh/night-owl.vim", lazy = true },
  -- { "folke/tokyonight.nvim",  lazy = true },
  -- {
  --   "L3MON4D3/LuaSnip",
  --   dependencies = {
  --     "rafamadriz/friendly-snippets",
  --   },
  --   event = "InsertEnter",
  --   config = require("plugins.luasnip").config,
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   dependencies = {
  --     "rcarriga/nvim-dap-ui",
  --     "leoluz/nvim-dap-go",
  --     "mfussenegger/nvim-dap-python",
  --     "theHamsta/nvim-dap-virtual-text",
  --   },
  --   event = "InsertEnter",
  --   config = require("plugins.nvim-dap").config,
  -- },
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "Issafalcon/neotest-dotnet",
  --     "nvim-neotest/neotest-python",
  --     "nvim-neotest/neotest-go",
  --   },
  --   event = "VeryLazy",
  --   config = require("plugins.neotest").config,
  -- },
  -- {
  --   "vimwiki/vimwiki",
  --   keys = {
  --     { "<leader>ww", "<cmd>VimwikiIndex<cr>" },
  --   },
  --   config = require("plugins.vimwiki").config,
  -- },
  -- {
  --   "nvim-neorg/neorg",
  --   build = ":Neorg sync-parsers",
  --   opts = {
  --       load = {
  --           ["core.defaults"] = {}, -- Loads default behaviour
  --           ["core.concealer"] = {}, -- Adds pretty icons to your documents
  --           ["core.dirman"] = { -- Manages Neorg workspaces
  --               config = {
  --                   workspaces = {
  --                       neorg = "~/neorg",
  --                       notes = "~/notes"
  --                   },
  --               },
  --           },
  --       },
  --   },
  --   dependencies = { { "nvim-lua/plenary.nvim" } },
  -- },
  -- {
  --   "codota/tabnine-nvim",
  --   config = require("plugins.tabnine").config,
  --   build = get_tabnine_build_string(),
  -- },
}, {
  defaults = {
    lazy = false,
  },
})
