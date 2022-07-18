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

  use({
    "kyazdani42/nvim-tree.lua",
    config = function()
      require'plugins.nvim-tree'
    end,
    requires = {"kyazdani42/nvim-web-devicons"}
  })

  use({
    "hoob3rt/lualine.nvim",
    config = function()
      require'plugins.lualine'
    end
  })

  use({
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
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

  use({
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    config = function()
      require'plugins.cmp'
    end
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    "p00f/nvim-ts-rainbow",
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

  use {
    'nvim-telescope/telescope.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    requires = {
      'nvim-lua/plenary.nvim', 
      'nvim-lua/popup.nvim', 
    },
    config = function()
      require'plugins.telescope'
    end
  }

  use({
    "mfussenegger/nvim-dap",
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
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
