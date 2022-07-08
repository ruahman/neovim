-- Install packer.nvim if not found.
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- startup and add configuration plugins
packer = require("packer")
packer.startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use("haishanh/night-owl.vim")

  use("tpope/vim-commentary")
  use("tpope/vim-surround")
  use("romainl/vim-cool")
  use("jiangmiao/auto-pairs")     

  use({
    "phaazon/hop.nvim",
    config = function()
      require'plugins.hop'
    end,
  })

  use({
    "unblevable/quick-scope",
    config = function()
      require'plugins.quick-scope'
    end
  })

  use("kyazdani42/nvim-web-devicons")
  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require'plugins.nvim-tree'
    end
  })

  use({
    "hoob3rt/lualine.nvim",
    config = function()
      require'plugins.lualine'
    end
  })

  use "rafamadriz/friendly-snippets"
  use({
    "L3MON4D3/LuaSnip",
    config = function()
      require'plugins.luasnip'
    end
  })

  use({
    "neovim/nvim-lspconfig",
    config = function()
      require'plugins.lsp'
    end
  })

  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-nvim-lsp")
  use("saadparwaiz1/cmp_luasnip")
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require'plugins.cmp'
    end
  })

  use("p00f/nvim-ts-rainbow")
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require'plugins.treesitter'
    end
  })


  use({
    "kevinhwang91/rnvimr",
    config = function()
      require'plugins.ranger'
    end
  })

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim', 
      'nvim-lua/popup.nvim', 
    },
    config = function()
      require'plugins.telescope'
    end
  }

  use("leoluz/nvim-dap-go")
  use("mfussenegger/nvim-dap-python")
  use("theHamsta/nvim-dap-virtual-text")
  use("rcarriga/nvim-dap-ui")
  use({
    "mfussenegger/nvim-dap",
    config = function()
      require'plugins.dap'
    end
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
