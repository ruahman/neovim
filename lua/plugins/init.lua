local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  
  -- colorshemes
  use "haishanh/night-owl.vim"
  use "folke/tokyonight.nvim"
  use {
    "EdenEast/nightfox.nvim",
    config = require('plugins/colorscheme').config
  }

  -- treesitter
  use {
    "p00f/nvim-ts-rainbow",
    requires = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = require('plugins/treesitter').config
  }

  use "tpope/vim-commentary"
  
  use "tpope/vim-surround"

  use "tpope/vim-fugitive"

  use "romainl/vim-cool"

  use "jiangmiao/auto-pairs"

  -- hop
  use {
    "phaazon/hop.nvim",
    config = require('plugins/hop').config
  }

  -- quick-scope
  use {
    "unblevable/quick-scope",
    config = require('plugins/quick-scope').config
  }

  -- nvim-tree
  use {
    "kyazdani42/nvim-tree.lua",
    requires = { 
      "kyazdani42/nvim-web-devicons"
    },
    config = require('plugins/nvim-tree').config
  }

  -- lualine
  use {
    "hoob3rt/lualine.nvim",
    config = require('plugins/lualine').config 
  }

  -- telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim"
    },
    config = require('plugins/telescope').config
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

  -- dashboard
  use {
    'goolord/alpha-nvim',
    config = require('plugins/dashboard').config
  }
  
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

--
--  -- bufferline
--  use {
--    'akinsho/bufferline.nvim',
--    tag = "v2.*",
--    requires = {
--      'kyazdani42/nvim-web-devicons',
--      'famiu/bufdelete.nvim'
--    }
--  }
--
--
--  -- lsp
--  use {
--    "neovim/nvim-lspconfig",
--    "williamboman/nvim-lsp-installer",
--  }
--
--  -- completion
--  use {
--    "hrsh7th/nvim-cmp",
--    "hrsh7th/cmp-buffer",
--    "hrsh7th/cmp-path",
--    "hrsh7th/cmp-nvim-lua",
--    "hrsh7th/cmp-nvim-lsp",
--    "saadparwaiz1/cmp_luasnip",
--    "onsails/lspkind.nvim",
--  }
--
--  -- snippets 
--  use {
--    "L3MON4D3/LuaSnip",
--    "rafamadriz/friendly-snippets",
--  }
--
--
--
--  -- dap
--  use {
--    "mfussenegger/nvim-dap",
--    "leoluz/nvim-dap-go",
--    "mfussenegger/nvim-dap-python",
--    "theHamsta/nvim-dap-virtual-text",
--    "rcarriga/nvim-dap-ui",
--  }
--
--  -- terminal
--  use {"akinsho/toggleterm.nvim", tag = 'v2.*'}
--
--  -- Automatically set up your configuration after cloning packer.nvim
--  -- Put this at the end after all plugins
--  if packer_bootstrap then
--    require('packer').sync()
--  end
--
--  require'plugins.luasnip'
--  require'plugins.bufferline'
--  require'plugins.toogleterm'
--  require'plugins.cmp'
--  require'plugins.lsp'
--  require'plugins.dap'
-- end)
