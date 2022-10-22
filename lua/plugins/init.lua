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

  -- themes
  use "haishanh/night-owl.vim"
  use 'folke/tokyonight.nvim'

  use "tpope/vim-commentary"
  use "tpope/vim-surround"
  use "tpope/vim-fugitive"
  use "romainl/vim-cool"
  use "jiangmiao/auto-pairs"

  use "phaazon/hop.nvim"

  use "unblevable/quick-scope"

  -- dashboard
  use {
      'goolord/alpha-nvim',
      config = function ()
          require'alpha'.setup(require'alpha.themes.dashboard'.config)
      end
  }

  -- bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = {
      'kyazdani42/nvim-web-devicons',
      'famiu/bufdelete.nvim'
    }
  }

  -- neotree
  use {
    "kyazdani42/nvim-tree.lua",
    "kyazdani42/nvim-web-devicons"
  }

  -- lualine
  use "hoob3rt/lualine.nvim"

  -- lsp
  use {
    "neovim/nvim-lspconfig",
    "williamboman/nvim-lsp-installer",
  }

  -- completion
  use {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
  }

  -- snippets 
  use {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  }

  -- treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    "p00f/nvim-ts-rainbow",
  }


  -- ranger
  -- use "kevinhwang91/rnvimr"

  -- telescope
  use {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    "nvim-telescope/telescope.nvim",
  }

  -- dap
  use {
    "mfussenegger/nvim-dap",
    "leoluz/nvim-dap-go",
    "mfussenegger/nvim-dap-python",
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
  }

  -- terminal
  use {"akinsho/toggleterm.nvim", tag = 'v2.*'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

  require'plugins.telescope'
  -- require'plugins.ranger'
  require'plugins.dap'
  require'plugins.treesitter'
  require'plugins.bufferline'
  require'plugins.toogleterm'
  require'plugins.cmp'
  require'plugins.lsp'
  require'plugins.luasnip'
  require'plugins.lualine'
  require'plugins.nvim-tree'
  require'plugins.quick-scope'
  require'plugins.hop'
end)
