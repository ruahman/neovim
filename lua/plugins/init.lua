local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- colorshemes
  use("haishanh/night-owl.vim")
  use("folke/tokyonight.nvim")
  use({
    "EdenEast/nightfox.nvim",
    config = require("plugins.colorscheme").config,
  })

  -- treesitter
  use({
    "p00f/nvim-ts-rainbow",
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = require("plugins.treesitter").config,
  })

  use("tpope/vim-commentary")

  use("tpope/vim-surround")

  use("tpope/vim-fugitive")

  use("romainl/vim-cool")

  use("jiangmiao/auto-pairs")

  use({ "lukas-reineke/indent-blankline.nvim" })

  -- hop
  use({
    "phaazon/hop.nvim",
    config = require("plugins.hop").config,
  })

  -- quick-scope
  use({
    "unblevable/quick-scope",
    config = require("plugins.quick-scope").config,
  })

  -- nvim-tree
  use({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    config = require("plugins.nvim-tree").config,
  })


  -- lualine
  use({
    "hoob3rt/lualine.nvim",
    config = require("plugins.lualine").config,
  })

  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = {
      'kyazdani42/nvim-web-devicons',
      'famiu/bufdelete.nvim'
    },
    config = require('plugins.bufferline').config
  }

  -- telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
    config = require("plugins.telescope").config,
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

  -- snippets
  use("L3MON4D3/LuaSnip")
  use({
    "rafamadriz/friendly-snippets",
    config = require("plugins.luasnip").config,
  })

  -- completion
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-nvim-lsp")
  use("saadparwaiz1/cmp_luasnip")
  use("onsails/lspkind.nvim")
  use({
    "hrsh7th/nvim-cmp",
    config = require("plugins.nvim-cmp").config,
  })

  -- lsp
  use({
    "neovim/nvim-lspconfig",
    config = require("plugins.lsp").config,
  })

  -- -- null-ls
  -- use({
  --   "jose-elias-alvarez/null-ls.nvim",
  --   config = require("plugins.null-ls").config,
  -- })

  -- dap
  use("mfussenegger/nvim-dap")
  use("leoluz/nvim-dap-go")
  use("mfussenegger/nvim-dap-python")
  use("theHamsta/nvim-dap-virtual-text")
  use({
    "rcarriga/nvim-dap-ui",
    config = require("plugins.dap").config,
  })

  -- mason
  use("williamboman/mason.nvim")
  use({
    "williamboman/mason-lspconfig.nvim",
    config = require("plugins.mason").config,
  })

  -- trouble
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = require("plugins.trouble").config,
  })


  -- terminal
  use({
    "akinsho/toggleterm.nvim",
    tag = "v2.*",
    config = require("plugins.toogleterm").config,
  })

  -- dashboard
  use({
    "goolord/alpha-nvim",
    config = require("plugins.dashboard").config,
  })

  -- -- Flutter
  -- use({
  --     "akinsho/flutter-tools.nvim",
  --     requires = "nvim-lua/plenary.nvim",
  --     config = require('plugins.flutter').config,
  -- })

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)

--
--
--  require'plugins.bufferline'
