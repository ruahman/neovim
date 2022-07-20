-- Install packer.nvim if not found.
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- startup and add configuration plugins
local packer = require("packer")
packer.startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  use "haishanh/night-owl.vim"

  use "tpope/vim-commentary"
  use "tpope/vim-surround"
  use "romainl/vim-cool"
  use "jiangmiao/auto-pairs"

  use "phaazon/hop.nvim"

  use "unblevable/quick-scope"

  use {
    "kyazdani42/nvim-tree.lua",
    "kyazdani42/nvim-web-devicons"
  }

  use "hoob3rt/lualine.nvim"

  use {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  }

  use {
    'folke/lsp-colors.nvim',
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
  }

  use {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    "p00f/nvim-ts-rainbow",
  }


  use "kevinhwang91/rnvimr"

  use {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    "nvim-telescope/telescope.nvim",
  }

  use {
    "mfussenegger/nvim-dap",
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

  require'plugins.telescope'
  require'plugins.ranger'
  require'plugins.dap'
  require'plugins.treesitter'
  require'plugins.cmp'
  require'plugins.lsp'
  require'plugins.luasnip'
  require'plugins.lualine'
  require'plugins.nvim-tree'
  require'plugins.quick-scope'
  require'plugins.hop'
end)
